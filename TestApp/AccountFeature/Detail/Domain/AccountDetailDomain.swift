//
//  AccountDetailDomain.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import ComposableArchitecture
import Foundation

@Reducer
public struct AccountDetailDomain {
    @ObservableState
    public struct State: Equatable {
        public var account: AccountDetailModel?
        public var transactions: [AccountTransactionDetailModel] = []
        public var selectedSegment = 0

        // Loader
        public var activity: Int = 0

        public mutating func addActivity() {
            activity += 1
        }

        public mutating func removeActivity() {
            activity -= 1
        }

        public var isLoading: Bool {
            return activity > 0
        }

        // Alert
        public var isShowingAlert: Bool = false
        public var alertRetryAction: Action?

        public init(account: AccountDetailModel) {
            self.account = account
        }
    }

    public enum Action: Equatable, BindableAction {
        case onAppear
        case fetchAccount
        case fetchAccountResult(TaskResult<AccountDetailModel>)
        case fetchTransactions
        case fetchTransactionsResult(TaskResult<AccountTransactionListModel>)
        case binding(BindingAction<State>)
    }

    @Dependency(\.service) private var service

    public init() {}

    public var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .merge(.send(.fetchAccount), .send(.fetchTransactions))
            case .fetchAccount:
                state.addActivity()
                return .run { [accountId = state.account?.accountNumber ?? ""] send in
                    await send(
                        .fetchAccountResult(TaskResult {
                            try await service.getTransparentAccountDetails(accountId: accountId)
                        })
                    )
                }
            case .fetchAccountResult(.success(let response)):
                state.removeActivity()
                state.account = response
                return .none
            case .fetchAccountResult(.failure(let error)):
                state.removeActivity()
                debugPrint("Error: \(error.localizedDescription)")
                state.isShowingAlert = true
                state.alertRetryAction = .fetchAccount
                return .none
            case .fetchTransactions:
                state.addActivity()
                return .run { [accountId = state.account?.accountNumber ?? ""] send in
                    await send(
                        .fetchTransactionsResult(TaskResult {
                            try await service.getTransparentAccountTransactions(accountId: accountId)
                        })
                    )
                }
            case .fetchTransactionsResult(.success(let response)):
                state.transactions = response.transactions
                state.removeActivity()
                return .none
            case .fetchTransactionsResult(.failure(let error)):
                state.removeActivity()
                debugPrint("Error: \(error.localizedDescription)")
                state.isShowingAlert = true
                state.alertRetryAction = .fetchTransactions
                return .none
            case .binding:
                return .none
            }
        }
    }
}

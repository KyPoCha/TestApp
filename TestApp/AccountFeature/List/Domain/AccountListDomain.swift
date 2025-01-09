//
//  AccountListDomain.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import ComposableArchitecture
import Foundation
import SwiftUI

@Reducer
public struct AccountListDomain {
    @ObservableState
    public struct State: Equatable {
        public var accounts: [AccountDetailModel] = []
        public var filteredAccounts: [AccountDetailModel] {
            guard filter != "" else { return accounts }
            return accounts.compactMap { account in
                let searchFilter = filter.lowercased()
                return account.description?.lowercased().contains(searchFilter) ?? false
                || account.name.lowercased().contains(searchFilter) ? account : nil
            }
        }
        public var filter: String = ""
        public var page: Int = 0
        public var path: NavigationPath = .init()

        // Loader
        public var isLoading: Bool = false

        // Alert
        public var isShowingAlert: Bool = false
        public var alertRetryAction: Action?

        public init() {}
    }

    public enum Action: Equatable, BindableAction {
        case onAppear
        case fetchAccounts
        case fetchAccountsResult(TaskResult<AccountListModel>)
        case fetchMoreAccounts
        case fetchMoreAccountsResult(TaskResult<AccountListModel>)
        case binding(BindingAction<State>)
    }

    @Dependency(\.service) private var service

    public init() {}

    public var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .send(.fetchAccounts)
            case .fetchAccounts:
                state.isLoading = true
                return .run { send in
                    await send(
                        .fetchAccountsResult(TaskResult {
                            try await service.getTransparentAccounts(page: 0)
                        })
                    )
                }
            case .fetchAccountsResult(.success(let response)):
                state.accounts = response.accounts
                state.isLoading = false
                return .none
            case .fetchAccountsResult(.failure(let error)):
                debugPrint("Error: \(error.localizedDescription)")
                state.isLoading = false
                state.alertRetryAction = .fetchAccounts
                state.isShowingAlert = true
                return .none
            case .fetchMoreAccounts:
                state.isLoading = true
                state.page += 1
                return .run { [page = state.page] send in
                    await send(
                        .fetchMoreAccountsResult(TaskResult {
                            try await service.getTransparentAccounts(page: page)
                        })
                    )
                }
            case .fetchMoreAccountsResult(.success(let response)):
                state.accounts.append(contentsOf: response.accounts)
                state.isLoading = false
                return .none
            case .fetchMoreAccountsResult(.failure(let error)):
                debugPrint("Error: \(error.localizedDescription)")
                state.isLoading = false
                state.alertRetryAction = .fetchAccounts
                state.isShowingAlert = true
                return .none
            case .binding:
                return .none
            }
        }
    }
}

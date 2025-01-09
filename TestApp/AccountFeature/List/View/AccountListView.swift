//
//  AccountListView.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import ComposableArchitecture
import SwiftUI

public struct AccountListView: View {
    @Bindable private var store: StoreOf<AccountListDomain>

    public init(store: StoreOf<AccountListDomain>) {
        self.store = store
    }

    public var body: some View {
        NavigationStack(path: $store.path) {
            List {
                ForEach(store.filteredAccounts, id: \.self) { account in
                    NavigationLink(value: account) {
                        AccountRowView(account: account)
                        // Not working correctly because BE returns always same data
                        // So ForEach generating a lot of runtime errors
                        // You can uncomment it, but it may not displayed correctly
//                            .onAppear {
//                                if account == store.accounts.last {
//                                    store.send(.fetchMoreAccounts)
//                                }
//                            }
                    }
                    .padding()
                }
            }
            .navigationTitle("Accounts")
            .navigationDestination(for: AccountDetailModel.self,
                                   destination: { account in
                                       AccountDetailView(store: .init(initialState: .init(account: account),
                                                                      reducer: {
                                                                          AccountDetailDomain()
                                                                      }))
                                   })
            .navigationDestination(for: AccountTransactionDetailModel.self,
                                   destination: { transaction in
                                       AccountTransactionDetailView(transaction: transaction)
                                   })
            .listStyle(.grouped)
            .alert("Error", isPresented: $store.isShowingAlert, actions: {
                if let retryAction = store.alertRetryAction {
                    Button("Retry") {
                        store.send(retryAction)
                    }
                }
                
                Button("Close", role: .cancel) {}
            }, message: {
                Text("Something went wrong. Please try again later.")
            })
            .loadingIndicator(store.isLoading)
            .onAppear {
                store.send(.onAppear)
            }
            .refreshable {
                store.send(.fetchAccounts)
            }
            .searchable(text: $store.filter)
        }
    }
}

#Preview {
    AccountListView(store: .init(initialState: .init(),
                                 reducer: {
                                     AccountListDomain()
                                 },
                                 withDependencies: { values in
                                     values.service = ServiceMock()
                                 }))
}

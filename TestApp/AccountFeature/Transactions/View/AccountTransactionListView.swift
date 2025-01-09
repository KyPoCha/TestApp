//
//  AccountTransactionListView.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import ComposableArchitecture
import SwiftUI

public struct AccountTransactionListView: View {
    public var transactions: [AccountTransactionDetailModel]
    
    public init(transactions: [AccountTransactionDetailModel]) {
        self.transactions = transactions
    }

    public var body: some View {
        List {
            ForEach(transactions, id: \.self) { transaction in
                NavigationLink(value: transaction) {
                    AccountTransactionRowView(transaction: transaction)
                }
                .padding()
            }
            .listRowBackground(Color.gray.opacity(0.3))
        }
        .scrollContentBackground(.hidden)
        .navigationTitle("Transactions")
        .listStyle(.insetGrouped)
        .frame(height: 500)
    }
}

#Preview {
    let store = StoreOf<AccountDetailDomain>.init(initialState: AccountDetailDomain.State(account: .init()),
                                                  reducer: {
                                                      AccountDetailDomain()
                                                  },
                                                  withDependencies: { values in
                                                      values.service = ServiceMock()
                                                  })
    AccountTransactionListView(transactions: store.transactions)
}


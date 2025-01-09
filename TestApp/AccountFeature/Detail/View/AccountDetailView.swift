//
//  AccountDetailView.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import ComposableArchitecture
import SwiftUI

public struct AccountDetailView: View {
    @Bindable private var store: StoreOf<AccountDetailDomain>

    public init(store: StoreOf<AccountDetailDomain>) {
        self.store = store
    }

    public var body: some View {
        List {
            VStack(alignment: .leading, spacing: 20) {
                Text("Available Balance")
                    .font(.headline)

                let balance = store.account?.balance ?? 0
                let currency = store.account?.currency ?? ""
                
                Text("\(String(format: "%.2f", balance)) \(currency)")
                    .font(.largeTitle)
                    .bold()
            }
            Section("Main information") {
                AccountDetailRowDataView(title: "Name",
                                         value: store.account?.name ?? "")
                
                AccountDetailRowDataView(title: "Account Number",
                                         value: store.account?.accountNumber ?? "")
                
                AccountDetailRowDataView(title: "IBAN",
                                         value: store.account?.iban ?? "")
                
                AccountDetailRowDataView(title: "Note",
                                         value: store.account?.note ?? "")
            }

            Section("Details") {
                Picker("Details", selection: $store.selectedSegment) {
                    Text("Statements").tag(0)
                    
                    Text("Transactions").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                if store.selectedSegment == 0 {
                    ForEach(store.account?.statements ?? [], id: \.self) { statement in
                        HStack {
                            Image(systemName: iconForFileType(statement))
                            
                            Text(statement)
                        }
                    }
                } else {
                    AccountTransactionListView(transactions: store.transactions)
                }
            }
        }
        .onAppear {
            store.send(.onAppear)
        }
        .navigationTitle("Account Detail")
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
    }

    private func iconForFileType(_ file: String) -> String {
        if file.hasSuffix(".pdf") {
            return "doc.text"
        } else if file.hasSuffix(".xml") {
            return "doc.richtext"
        } else {
            return "doc"
        }
    }
}

#Preview {
    AccountDetailView(store: .init(initialState: .init(account: .init()),
                                   reducer: {
                                       AccountDetailDomain()
                                   },
                                   withDependencies: { values in
                                       values.service = ServiceMock()
                                   }))
}


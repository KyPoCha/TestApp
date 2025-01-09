//
//  AccountTransactionDetailView.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import SwiftUI

public struct AccountTransactionDetailView: View {
    private let transaction: AccountTransactionDetailModel

    public init(transaction: AccountTransactionDetailModel) {
        self.transaction = transaction
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Text(transaction.typeDescription)
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                    
                    Image(systemName: transaction.amount.value >= 0 ? "arrow.left.circle.fill" : "arrow.right.circle.fill")
                        .foregroundColor(transaction.amount.value >= 0 ? .green : .red)
                        .font(.title)
                }

                Divider()

                VStack(alignment: .leading, spacing: 10) {
                    DetailRow(label: "Amount",
                              value: "\(String(format: "%.2f", transaction.amount.value)) \(transaction.amount.currency)")
                    
                    DetailRow(label: "Due Date",
                              value: transaction.dueDate.dateFormatter())
                    
                    DetailRow(label: "Processing Date",
                              value: transaction.processingDate.dateFormatter())
                }

                Divider()

                VStack(alignment: .leading, spacing: 10) {
                    Text("Sender").font(.headline)
                    
                    DetailRow(label: "Name",
                              value: transaction.sender.description ?? "-")
                    
                    DetailRow(label: "Account Number",
                              value: transaction.sender.accountNumber)
                    
                    DetailRow(label: "Bank Code",
                              value: transaction.sender.bankCode)
                    
                    DetailRow(label: "IBAN",
                              value: transaction.sender.iban)
                }

                Divider()

                VStack(alignment: .leading, spacing: 10) {
                    Text("Receiver").font(.headline)
                    
                    DetailRow(label: "Account Number",
                              value: transaction.receiver.accountNumber)
                    
                    DetailRow(label: "Bank Code",
                              value: transaction.receiver.bankCode)
                    
                    DetailRow(label: "IBAN",
                              value: transaction.receiver.iban)
                }

                Spacer()
            }
            .padding()
        }
    }
}

public struct DetailRow: View {
    public let label: String
    public let value: String

    public var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)

            HStack {
                Text(value)
                    .font(.headline)
                
                Spacer()
            }
        }
    }
}

#Preview {
    AccountTransactionDetailView(transaction: AccountTransactionDetailModel(amount: AccountTransactionAmountModel(value: 0.0,
                                                                                                                  precision: 2,
                                                                                                                  currency: ""),
                                                                            type: "",
                                                                            dueDate: "",
                                                                            processingDate: "",
                                                                            sender: AccountTransactionSenderModel(accountNumber: "",
                                                                                                                  bankCode: "",
                                                                                                                  iban: "",
                                                                                                                  specificSymbol: "",
                                                                                                                  specificSymbolParty: "",
                                                                                                                  variableSymbol: "",
                                                                                                                  constantSymbol: "",
                                                                                                                  name: "",
                                                                                                                  description: ""),
                                                                            receiver: AccountTransactionReceiverModel(accountNumber: "",
                                                                                                                      bankCode: "",
                                                                                                                      iban: ""),
                                                                            typeDescription: "Type Description"))
}


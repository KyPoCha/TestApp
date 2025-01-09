//
//  AccountTransactionRowView.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Foundation
import SwiftUI

public struct AccountTransactionRowView: View {
    private let transaction: AccountTransactionDetailModel

    public init(transaction: AccountTransactionDetailModel) {
        self.transaction = transaction
    }

    public var body: some View {
        VStack(alignment: .leading) {
            Text(transaction.typeDescription)
                .font(.headline)
                .padding(.bottom, 5)

            HStack {
                Text("Amount: \(transaction.amount.value, specifier: "%.2f") \(transaction.amount.currency)")
                    .font(.footnote)

                Spacer()

                Image(systemName: transaction.amount.value >= 0 ? "arrow.left.circle.fill" : "arrow.right.circle.fill")
                    .foregroundColor(transaction.amount.value >= 0 ? .green : .red)
            }
            
            Text("Due Date: \(transaction.dueDate.dateFormatter())")
                .font(.footnote)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
                .padding(.bottom, 2.5)
            
            Text("Sender: \(transaction.sender.description ?? "-")")
                .font(.footnote)
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    AccountTransactionRowView(transaction: AccountTransactionDetailModel(amount: AccountTransactionAmountModel(value: -1.74, precision: 0, currency: "CZK"),
                                                                         type: "40900",
                                                                         dueDate: "2016-08-31T00:00:00",
                                                                         processingDate: "2016-08-31T00:00:00",
                                                                         sender: AccountTransactionSenderModel(accountNumber: "000000-0000000000",
                                                                                                               bankCode: "0800",
                                                                                                               iban: "CZ13 0800 0000 0029 0647 8309",
                                                                                                               specificSymbol: "0000000000",
                                                                                                               specificSymbolParty: "0000000000",
                                                                                                               variableSymbol: "0000000000",
                                                                                                               constantSymbol: "0000",
                                                                                                               name: "xxxxxxxxxxxx9126",
                                                                                                               description: "KORBEL ŠTĚPÁN"),
                                                                         receiver: AccountTransactionReceiverModel(accountNumber: "000000-2906478309", bankCode: "0800", iban: "CZ13 0800 0000 0029 0647 8309"),
                                                                         typeDescription: "Poplatky"))
}


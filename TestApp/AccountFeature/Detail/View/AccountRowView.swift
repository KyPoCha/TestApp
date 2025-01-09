//
//  AccountRowView.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import SwiftUI

public struct AccountRowView: View {
    private let account: AccountDetailModel

    public init(account: AccountDetailModel) {
        self.account = account
    }

    public var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 50, height: 50, alignment: .center)
                .padding(.trailing)

            VStack(alignment: .leading) {
                Text(account.name)
                    .font(.headline)
                Text(account.accountNumber)
            }

            Spacer()
        }
    }
}

#Preview {
    AccountRowView(account: AccountDetailModel(accountNumber: "000000-2906478309",
                                               bankCode: "0800",
                                               transparencyFrom: "2016-08-18T00:00:00",
                                               transparencyTo: "3000-01-01T00:00:00",
                                               publicationTo: "3000-01-01T00:00:00",
                                               actualizationDate: "2016-09-07T10:00:06",
                                               balance: 1_063_961.87,
                                               currency: "CZK",
                                               name: "SVAZEK OBCÍ - REGION DOLNÍ BEROUNKA",
                                               description: "sbírka pro Nepál",
                                               note: "Příjmový účet",
                                               iban: "CZ13 0800 0000 0029 0647 8309",
                                               statements: ["RR_SK.COM..xml", "prevedeni-it-majetku-do-uzivani.pdf"]))
}


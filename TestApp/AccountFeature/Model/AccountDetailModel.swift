//
//  AccountDetailModel.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Foundation

public struct AccountDetailModel: Codable, Equatable, Hashable {
    public let accountNumber: String
    public let bankCode: String
    public let transparencyFrom: String
    public let transparencyTo: String
    public let publicationTo: String
    public let actualizationDate: String
    public let balance: Double
    public let currency: String?
    public let name: String
    public let description: String?
    public let note: String?
    public let iban: String
    public let statements: [String]?

    public init(accountNumber: String = "",
                bankCode: String = "",
                transparencyFrom: String = "",
                transparencyTo: String = "",
                publicationTo: String = "",
                actualizationDate: String = "",
                balance: Double = 0,
                currency: String = "",
                name: String = "",
                description: String = "",
                note: String = "",
                iban: String = "",
                statements: [String] = []) {
        self.accountNumber = accountNumber
        self.bankCode = bankCode
        self.transparencyFrom = transparencyFrom
        self.transparencyTo = transparencyTo
        self.publicationTo = publicationTo
        self.actualizationDate = actualizationDate
        self.balance = balance
        self.currency = currency
        self.name = name
        self.description = description
        self.note = note
        self.iban = iban
        self.statements = statements
    }
}

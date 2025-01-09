//
//  AccountTransactionSenderModel.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Foundation

public struct AccountTransactionSenderModel: Codable, Equatable, Hashable {
    public let accountNumber: String
    public let bankCode: String
    public let iban: String
    public let specificSymbol: String?
    public let specificSymbolParty: String?
    public let variableSymbol: String?
    public let constantSymbol: String?
    public let name: String?
    public let description: String?
}

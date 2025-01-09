//
//  AccountTransactionReceiverModel.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Foundation

public struct AccountTransactionReceiverModel: Codable, Equatable, Hashable {
    public let accountNumber: String
    public let bankCode: String
    public let iban: String
}

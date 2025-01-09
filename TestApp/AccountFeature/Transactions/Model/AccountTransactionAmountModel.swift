//
//  AccountTransactionAmountModel.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Foundation

public struct AccountTransactionAmountModel: Codable, Equatable, Hashable {
    public let value: Double
    public let precision: Int
    public let currency: String
}

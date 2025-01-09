//
//  AccountTransactionDetailModel.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Foundation

public struct AccountTransactionDetailModel: Codable, Equatable, Hashable {
    public let amount: AccountTransactionAmountModel
    public let type: String
    public let dueDate: String
    public let processingDate: String
    public let sender: AccountTransactionSenderModel
    public let receiver: AccountTransactionReceiverModel
    public let typeDescription: String
}

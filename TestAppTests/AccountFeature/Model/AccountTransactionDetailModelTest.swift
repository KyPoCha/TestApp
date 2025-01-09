//
//  AccountListModelTest.swift
//  TestAppTests
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Testing
import Foundation
@testable import TestApp

struct AccountTransactionDetailModelTest {

    @Test func testTransactionDetailModelInitialization() async throws {
        let amount = AccountTransactionAmountModel(value: 100.0,
                                                   precision: 2,
                                                   currency: "USD")
        
        let sender = AccountTransactionSenderModel(accountNumber: "123",
                                                   bankCode: "001",
                                                   iban: "IBAN123",
                                                   specificSymbol: "SS123",
                                                   specificSymbolParty: "SSP456",
                                                   variableSymbol: "VS789",
                                                   constantSymbol: "CS012",
                                                   name: "Alice Smith",
                                                   description: "Salary Transfer")
        
        let receiver = AccountTransactionReceiverModel(accountNumber: "456",
                                                       bankCode: "002",
                                                       iban: "IBAN456")
        
        let transaction = AccountTransactionDetailModel(amount: amount,
                                                        type: "Credit",
                                                        dueDate: "2025-01-10",
                                                        processingDate: "2025-01-09",
                                                        sender: sender,
                                                        receiver: receiver,
                                                        typeDescription: "Salary Payment")
        
        #expect(transaction.type == "Credit")
        #expect(transaction.amount.value == 100.0)
        #expect(transaction.sender.accountNumber == "123")
    }

    @Test func testTransactionDetailModelEquality() async throws {
        let amount = AccountTransactionAmountModel(value: 100.0,
                                                   precision: 2,
                                                   currency: "USD")
        
        let sender = AccountTransactionSenderModel(accountNumber: "123",
                                                   bankCode: "001",
                                                   iban: "IBAN123",
                                                   specificSymbol: "SS123",
                                                   specificSymbolParty: "SSP456",
                                                   variableSymbol: "VS789",
                                                   constantSymbol: "CS012",
                                                   name: "Alice Smith",
                                                   description: "Salary Transfer")
        
        let receiver = AccountTransactionReceiverModel(accountNumber: "456",
                                                       bankCode: "002",
                                                       iban: "IBAN456")
        
        let transaction1 = AccountTransactionDetailModel(amount: amount,
                                                         type: "Credit",
                                                         dueDate: "2025-01-10",
                                                         processingDate: "2025-01-09",
                                                         sender: sender,
                                                         receiver: receiver,
                                                         typeDescription: "Salary Payment")
        
        let transaction2 = transaction1
        
        #expect(transaction1 == transaction2)
    }

    @Test func testTransactionDetailModelCodable() async throws {
        let amount = AccountTransactionAmountModel(value: 100.0,
                                                   precision: 2,
                                                   currency: "USD")
        let sender = AccountTransactionSenderModel(accountNumber: "123",
                                                   bankCode: "001",
                                                   iban: "IBAN123",
                                                   specificSymbol: "SS123",
                                                   specificSymbolParty: "SSP456",
                                                   variableSymbol: "VS789",
                                                   constantSymbol: "CS012",
                                                   name: "Alice Smith",
                                                   description: "Salary Transfer")
        
        let receiver = AccountTransactionReceiverModel(accountNumber: "456",
                                                       bankCode: "002",
                                                       iban: "IBAN456")
        
        let transaction = AccountTransactionDetailModel(amount: amount,
                                                        type: "Credit",
                                                        dueDate: "2025-01-10",
                                                        processingDate: "2025-01-09",
                                                        sender: sender,
                                                        receiver: receiver,
                                                        typeDescription: "Salary Payment")
        
        let encoder = JSONEncoder()
        let data = try encoder.encode(transaction)
        
        let decoder = JSONDecoder()
        let decodedTransaction = try decoder.decode(AccountTransactionDetailModel.self, from: data)
        
        #expect(transaction == decodedTransaction)
    }
}

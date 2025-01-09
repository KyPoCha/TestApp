//
//  AccountTransactionListModelTest.swift
//  TestAppTests
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Testing
import Foundation
@testable import TestApp

struct AccountTransactionListModelTest {

    @Test func testTransactionListModelInitialization() async throws {
        let amount1 = AccountTransactionAmountModel(value: 500.00,
                                                    precision: 2,
                                                    currency: "USD")
        
        let sender1 = AccountTransactionSenderModel(accountNumber: "111222333",
                                                    bankCode: "0600",
                                                    iban: "IBAN1112223334445556",
                                                    specificSymbol: nil,
                                                    specificSymbolParty: nil,
                                                    variableSymbol: "VS001",
                                                    constantSymbol: "CS001",
                                                    name: "Charlie Brown",
                                                    description: "Gift")
        
        let receiver1 = AccountTransactionReceiverModel(accountNumber: "444555666",
                                                        bankCode: "0700",
                                                        iban: "IBAN4445556667778889")
        
        let transaction1 = AccountTransactionDetailModel(amount: amount1,
                                                         type: "Debit",
                                                         dueDate: "2025-02-01",
                                                         processingDate: "2025-01-31",
                                                         sender: sender1,
                                                         receiver: receiver1,
                                                         typeDescription: "Gift Payment")
        
        let amount2 = AccountTransactionAmountModel(value: 1200.50,
                                                    precision: 2,
                                                    currency: "EUR")
        
        let sender2 = AccountTransactionSenderModel(accountNumber: "777888999",
                                                    bankCode: "0800",
                                                    iban: "IBAN7778889990001112",
                                                    specificSymbol: "SS789",
                                                    specificSymbolParty: "SSP789",
                                                    variableSymbol: "VS002",
                                                    constantSymbol: "CS002",
                                                    name: "Dana White",
                                                    description: "Invoice Payment")
        
        let receiver2 = AccountTransactionReceiverModel(accountNumber: "000111222",
                                                        bankCode: "0900",
                                                        iban: "IBAN0001112223334445")
        
        let transaction2 = AccountTransactionDetailModel(amount: amount2,
                                                         type: "Credit",
                                                         dueDate: "2025-03-01",
                                                         processingDate: "2025-02-28",
                                                         sender: sender2,
                                                         receiver: receiver2,
                                                         typeDescription: "Invoice Payment Received")
        
        let transactionList = AccountTransactionListModel(pageNumber: 1,
                                                          pageSize: 2,
                                                          pageCount: 1,
                                                          nextPage: 0,
                                                          recordCount: 2,
                                                          transactions: [transaction1, transaction2])
        
        #expect(transactionList.pageNumber == 1)
        #expect(transactionList.pageSize == 2)
        #expect(transactionList.transactions.count == 2)
        #expect(transactionList.transactions.first?.type == "Debit")
        #expect(transactionList.transactions.last?.type == "Credit")
    }

    @Test func testTransactionListModelEquality() async throws {
        let amount = AccountTransactionAmountModel(value: 500.00,
                                                   precision: 2,
                                                   currency: "USD")
        
        let sender = AccountTransactionSenderModel(accountNumber: "111222333",
                                                   bankCode: "0600",
                                                   iban: "IBAN1112223334445556",
                                                   specificSymbol: nil,
                                                   specificSymbolParty: nil,
                                                   variableSymbol: "VS001",
                                                   constantSymbol: "CS001",
                                                   name: "Charlie Brown",
                                                   description: "Gift")
        
        let receiver = AccountTransactionReceiverModel(accountNumber: "444555666",
                                                       bankCode: "0700",
                                                       iban: "IBAN4445556667778889")
        
        let transaction = AccountTransactionDetailModel(amount: amount,
                                                        type: "Debit",
                                                        dueDate: "2025-02-01",
                                                        processingDate: "2025-01-31",
                                                        sender: sender,
                                                        receiver: receiver,
                                                        typeDescription: "Gift Payment")
        
        let transactionList1 = AccountTransactionListModel(pageNumber: 1,
                                                           pageSize: 1,
                                                           pageCount: 1,
                                                           nextPage: 0,
                                                           recordCount: 1,
                                                           transactions: [transaction])
        
        let transactionList2 = transactionList1
        let transactionList3 = AccountTransactionListModel(pageNumber: 2,
                                                           pageSize: 1,
                                                           pageCount: 2,
                                                           nextPage: 1,
                                                           recordCount: 2,
                                                           transactions: [transaction])
        
        #expect(transactionList1 == transactionList2)
        #expect(transactionList1 != transactionList3)
    }

    @Test func testTransactionListModelCodable() async throws {
        let amount = AccountTransactionAmountModel(value: 500.00,
                                                   precision: 2,
                                                   currency: "USD")
        
        let sender = AccountTransactionSenderModel(accountNumber: "111222333",
                                                   bankCode: "0600",
                                                   iban: "IBAN1112223334445556",
                                                   specificSymbol: nil,
                                                   specificSymbolParty: nil,
                                                   variableSymbol: "VS001",
                                                   constantSymbol: "CS001",
                                                   name: "Charlie Brown",
                                                   description: "Gift")
        
        let receiver = AccountTransactionReceiverModel(accountNumber: "444555666",
                                                       bankCode: "0700",
                                                       iban: "IBAN4445556667778889")
        
        let transaction = AccountTransactionDetailModel(amount: amount,
                                                        type: "Debit",
                                                        dueDate: "2025-02-01",
                                                        processingDate: "2025-01-31",
                                                        sender: sender,
                                                        receiver: receiver,
                                                        typeDescription: "Gift Payment")
        
        let transactionList = AccountTransactionListModel(pageNumber: 1,
                                                          pageSize: 1,
                                                          pageCount: 1,
                                                          nextPage: 0,
                                                          recordCount: 1,
                                                          transactions: [transaction])
        
        let encoder = JSONEncoder()
        let data = try encoder.encode(transactionList)
        
        let decoder = JSONDecoder()
        let decodedTransactionList = try decoder.decode(AccountTransactionListModel.self, from: data)
        
        #expect(transactionList == decodedTransactionList)
    }
}

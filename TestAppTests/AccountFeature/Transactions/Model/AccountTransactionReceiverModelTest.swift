//
//  AccountTransactionReceiverModelTest.swift
//  TestAppTests
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Testing
import Foundation
@testable import TestApp

struct AccountTransactionReceiverModelTest {

    @Test func testTransactionReceiverModelInitialization() async throws {
        let receiver = AccountTransactionReceiverModel(accountNumber: "654321098",
                                                       bankCode: "0400",
                                                       iban: "IBAN6543210987654321")
        
        #expect(receiver.accountNumber == "654321098")
        #expect(receiver.bankCode == "0400")
        #expect(receiver.iban == "IBAN6543210987654321")
    }

    @Test func testTransactionReceiverModelEquality() async throws {
        let receiver1 = AccountTransactionReceiverModel(accountNumber: "654321098",
                                                        bankCode: "0400",
                                                        iban: "IBAN6543210987654321")
        
        let receiver2 = AccountTransactionReceiverModel(accountNumber: "654321098",
                                                        bankCode: "0400",
                                                        iban: "IBAN6543210987654321")
        
        let receiver3 = AccountTransactionReceiverModel(accountNumber: "987654321",
                                                        bankCode: "0500",
                                                        iban: "IBAN9876543210987654")
        
        #expect(receiver1 == receiver2)
        #expect(receiver1 != receiver3)
    }

    @Test func testTransactionReceiverModelCodable() async throws {
        let receiver = AccountTransactionReceiverModel(accountNumber: "654321098",
                                                       bankCode: "0400",
                                                       iban: "IBAN6543210987654321")
        
        let encoder = JSONEncoder()
        let data = try encoder.encode(receiver)
        
        let decoder = JSONDecoder()
        let decodedReceiver = try decoder.decode(AccountTransactionReceiverModel.self, from: data)
        
        #expect(receiver == decodedReceiver)
    }
}

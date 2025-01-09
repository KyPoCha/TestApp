//
//  AccountTransactionSenderModelTest.swift
//  TestAppTests
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Testing
import Foundation
@testable import TestApp

struct AccountTransactionSenderModelTest {

    @Test func testTransactionSenderModelInitialization() async throws {
        let sender = AccountTransactionSenderModel(accountNumber: "789012345",
                                                   bankCode: "0300",
                                                   iban: "IBAN789012345678",
                                                   specificSymbol: "SS123",
                                                   specificSymbolParty: "SSP456",
                                                   variableSymbol: "VS789",
                                                   constantSymbol: "CS012",
                                                   name: "Alice Smith",
                                                   description: "Salary Transfer")
        
        #expect(sender.accountNumber == "789012345")
        #expect(sender.bankCode == "0300")
        #expect(sender.iban == "IBAN789012345678")
        #expect(sender.specificSymbol == "SS123")
        #expect(sender.variableSymbol == "VS789")
        #expect(sender.name == "Alice Smith")
    }

    @Test func testTransactionSenderModelEquality() async throws {
        let sender1 = AccountTransactionSenderModel(accountNumber: "789012345",
                                                    bankCode: "0300",
                                                    iban: "IBAN789012345678",
                                                    specificSymbol: "SS123",
                                                    specificSymbolParty: "SSP456",
                                                    variableSymbol: "VS789",
                                                    constantSymbol: "CS012",
                                                    name: "Alice Smith",
                                                    description: "Salary Transfer")
        
        let sender2 = AccountTransactionSenderModel(accountNumber: "789012345",
                                                    bankCode: "0300",
                                                    iban: "IBAN789012345678",
                                                    specificSymbol: "SS123",
                                                    specificSymbolParty: "SSP456",
                                                    variableSymbol: "VS789",
                                                    constantSymbol: "CS012",
                                                    name: "Alice Smith",
                                                    description: "Salary Transfer")
        
        let sender3 = AccountTransactionSenderModel(accountNumber: "123456789",
                                                    bankCode: "0400",
                                                    iban: "IBAN123456789012",
                                                    specificSymbol: nil,
                                                    specificSymbolParty: nil,
                                                    variableSymbol: nil,
                                                    constantSymbol: nil,
                                                    name: "Bob Johnson",
                                                    description: "Invoice Payment")
        
        #expect(sender1 == sender2)
        #expect(sender1 != sender3)
    }

    @Test func testTransactionSenderModelCodable() async throws {
        let sender = AccountTransactionSenderModel(accountNumber: "789012345",
                                                   bankCode: "0300",
                                                   iban: "IBAN789012345678",
                                                   specificSymbol: "SS123",
                                                   specificSymbolParty: "SSP456",
                                                   variableSymbol: "VS789",
                                                   constantSymbol: "CS012",
                                                   name: "Alice Smith",
                                                   description: "Salary Transfer")
        
        let encoder = JSONEncoder()
        let data = try encoder.encode(sender)
        
        let decoder = JSONDecoder()
        let decodedSender = try decoder.decode(AccountTransactionSenderModel.self, from: data)
        
        #expect(sender == decodedSender)
    }
}

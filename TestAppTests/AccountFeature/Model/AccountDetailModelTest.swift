//
//  AccountDetailModelTest.swift
//  TestAppTests
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Testing
import Foundation
@testable import TestApp

struct AccountDetailModelTest {

    @Test func testAccountDetailModelInitialization() async throws {
        let account = AccountDetailModel(accountNumber: "123456789",
                                         bankCode: "0100",
                                         transparencyFrom: "2025-01-01",
                                         transparencyTo: "2025-12-31",
                                         publicationTo: "2025-12-31",
                                         actualizationDate: "2025-01-09",
                                         balance: 1000.50,
                                         currency: "USD",
                                         name: "John Doe",
                                         description: "Test account",
                                         note: "Test note",
                                         iban: "US12345678901234567890",
                                         statements: ["Statement1", "Statement2"])
        
        #expect(account.accountNumber == "123456789")
        #expect(account.bankCode == "0100")
        #expect(account.balance == 1000.50)
        #expect(account.name == "John Doe")
        #expect(account.statements?.count == 2)
    }

    @Test func testAccountDetailModelCodable() async throws {
        let account = AccountDetailModel(accountNumber: "123456789",
                                         bankCode: "0100",
                                         transparencyFrom: "2025-01-01",
                                         transparencyTo: "2025-12-31",
                                         publicationTo: "2025-12-31",
                                         actualizationDate: "2025-01-09",
                                         balance: 1000.50,
                                         currency: "USD",
                                         name: "John Doe",
                                         description: "Test account",
                                         note: "Test note",
                                         iban: "US12345678901234567890",
                                         statements: ["Statement1", "Statement2"])
        
        let encoder = JSONEncoder()
        let data = try encoder.encode(account)
        
        let decoder = JSONDecoder()
        let decodedAccount = try decoder.decode(AccountDetailModel.self, from: data)
        
        #expect(account == decodedAccount)
    }

    @Test func testAccountDetailModelEquality() async throws {
        let account1 = AccountDetailModel(accountNumber: "123",
                                          bankCode: "001",
                                          name: "Account1",
                                          iban: "IBAN1")
        
        let account2 = AccountDetailModel(accountNumber: "123",
                                          bankCode: "001",
                                          name: "Account1",
                                          iban: "IBAN1")
        
        let account3 = AccountDetailModel(accountNumber: "456",
                                          bankCode: "002",
                                          name: "Account2",
                                          iban: "IBAN2")
        
        #expect(account1 == account2)
        #expect(account1 != account3)
    }

}

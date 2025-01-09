//
//  AccountTransactionAmountModelTest.swift
//  TestAppTests
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Testing
import Foundation
@testable import TestApp

struct AccountTransactionAmountModelTest {

    @Test func testTransactionAmountModelInitialization() async throws {
        let amount = AccountTransactionAmountModel(value: 1500.75,
                                                   precision: 2,
                                                   currency: "EUR")
        
        #expect(amount.value == 1500.75)
        #expect(amount.precision == 2)
        #expect(amount.currency == "EUR")
    }

    @Test func testTransactionAmountModelEquality() async throws {
        let amount1 = AccountTransactionAmountModel(value: 1500.75,
                                                    precision: 2,
                                                    currency: "EUR")
        
        let amount2 = AccountTransactionAmountModel(value: 1500.75,
                                                    precision: 2,
                                                    currency: "EUR")
        
        let amount3 = AccountTransactionAmountModel(value: 2000.00,
                                                    precision: 2,
                                                    currency: "USD")
        
        #expect(amount1 == amount2)
        #expect(amount1 != amount3)
    }

    @Test func testTransactionAmountModelCodable() async throws {
        let amount = AccountTransactionAmountModel(value: 1500.75,
                                                   precision: 2,
                                                   currency: "EUR")
        
        let encoder = JSONEncoder()
        let data = try encoder.encode(amount)
        
        let decoder = JSONDecoder()
        let decodedAmount = try decoder.decode(AccountTransactionAmountModel.self, from: data)
        
        #expect(amount == decodedAmount)
    }
}

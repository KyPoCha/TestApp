//
//  TestAppTests.swift
//  TestAppTests
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Testing
@testable import TestApp

struct TestAppTests {

    @Test func example() async throws {
        let accountDetailTests = AccountDetailModelTest()
        try await accountDetailTests.testAccountDetailModelInitialization()
        try await accountDetailTests.testAccountDetailModelCodable()
        try await accountDetailTests.testAccountDetailModelEquality()
        
        let accountListTests = AccountListModelTest()
        try await accountListTests.testAccountListModelInitialization()
        try await accountListTests.testAccountListModelEquality()
        try await accountListTests.testAccountListModelCodable()
        
        let transactionAmountTests = AccountTransactionAmountModelTest()
        try await transactionAmountTests.testTransactionAmountModelInitialization()
        try await transactionAmountTests.testTransactionAmountModelEquality()
        try await transactionAmountTests.testTransactionAmountModelCodable()
        
        let transactionSenderTests = AccountTransactionSenderModelTest()
        try await transactionSenderTests.testTransactionSenderModelInitialization()
        try await transactionSenderTests.testTransactionSenderModelEquality()
        try await transactionSenderTests.testTransactionSenderModelCodable()
        
        let transactionReceiverTests = AccountTransactionReceiverModelTest()
        try await transactionReceiverTests.testTransactionReceiverModelInitialization()
        try await transactionReceiverTests.testTransactionReceiverModelEquality()
        try await transactionReceiverTests.testTransactionReceiverModelCodable()
        
        let transactionDetailTests = AccountTransactionDetailModelTest()
        try await transactionDetailTests.testTransactionDetailModelInitialization()
        try await transactionDetailTests.testTransactionDetailModelEquality()
        try await transactionDetailTests.testTransactionDetailModelCodable()
        
        let transactionListTests = AccountTransactionListModelTest()
        try await transactionListTests.testTransactionListModelInitialization()
        try await transactionListTests.testTransactionListModelEquality()
        try await transactionListTests.testTransactionListModelCodable()
    }

}

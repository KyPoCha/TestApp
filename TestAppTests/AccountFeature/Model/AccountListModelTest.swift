//
//  AccountListModelTest.swift
//  TestAppTests
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Testing
import Foundation
@testable import TestApp

struct AccountListModelTest {

    @Test func testAccountListModelInitialization() async throws {
        let account1 = AccountDetailModel(accountNumber: "123",
                                          bankCode: "001",
                                          name: "Account1",
                                          iban: "IBAN1")
        
        let account2 = AccountDetailModel(accountNumber: "456",
                                          bankCode: "002",
                                          name: "Account2",
                                          iban: "IBAN2")
        
        let accountList = AccountListModel(pageNumber: 1,
                                           pageSize: 2,
                                           pageCount: 1,
                                           recordCount: 2,
                                           nextPage: 0,
                                           accounts: [account1, account2])
        
        #expect(accountList.pageNumber == 1)
        #expect(accountList.accounts.count == 2)
        #expect(accountList.accounts.first?.name == "Account1")
    }

    @Test func testAccountListModelEquality() async throws {
        let account1 = AccountDetailModel(accountNumber: "123",
                                          bankCode: "001",
                                          name: "Account1",
                                          iban: "IBAN1")
        
        let account2 = AccountDetailModel(accountNumber: "456",
                                          bankCode: "002",
                                          name: "Account2",
                                          iban: "IBAN2")
        
        let accountList1 = AccountListModel(pageNumber: 1,
                                            pageSize: 2,
                                            pageCount: 1,
                                            recordCount: 2,
                                            nextPage: 0,
                                            accounts: [account1, account2])
        
        let accountList2 = accountList1
        
        #expect(accountList1 == accountList2)
    }

    @Test func testAccountListModelCodable() async throws {
        let account1 = AccountDetailModel(accountNumber: "123",
                                          bankCode: "001",
                                          name: "Account1",
                                          iban: "IBAN1")
        
        let account2 = AccountDetailModel(accountNumber: "456",
                                          bankCode: "002",
                                          name: "Account2",
                                          iban: "IBAN2")
        
        let accountList = AccountListModel(pageNumber: 1,
                                           pageSize: 2,
                                           pageCount: 1,
                                           recordCount: 2,
                                           nextPage: 0,
                                           accounts: [account1, account2])
        
        let encoder = JSONEncoder()
        let data = try encoder.encode(accountList)
        
        let decoder = JSONDecoder()
        let decodedAccountList = try decoder.decode(AccountListModel.self, from: data)
        
        #expect(accountList == decodedAccountList)
    }

}

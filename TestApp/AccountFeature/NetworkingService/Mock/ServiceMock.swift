//
//  ServiceMock.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Foundation

public struct ServiceMock: ServiceProtocol {
    public func getTransparentAccounts(page: Int) async throws -> AccountListModel {
        return Bundle.main.decode(AccountListModel.self,
                                  from: "transparentAccountList.json")
    }

    public func getTransparentAccountDetails(accountId: String) async throws -> AccountDetailModel {
        return Bundle.main.decode(AccountDetailModel.self,
                                  from: "transparentAccountDetails.json")
    }

    public func getTransparentAccountTransactions(accountId: String) async throws -> AccountTransactionListModel {
        return Bundle.main.decode(AccountTransactionListModel.self,
                                  from: "transparentAccountTransactionList.json")
    }
}

//
//  ServiceProtocol.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Foundation

public protocol ServiceProtocol {
    func getTransparentAccounts(page: Int) async throws -> AccountListModel

    func getTransparentAccountDetails(accountId: String) async throws -> AccountDetailModel

    func getTransparentAccountTransactions(accountId: String) async throws -> AccountTransactionListModel
}

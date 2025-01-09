//
//  ServiceProvider.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Foundation

public enum ServiceProvider {
    case getTransparentAccounts
    case getTransparentAccountDetails(accountId: String)
    case getTransparentAccountTransactions(accountId: String)

    public var path: String {
        switch self {
        case .getTransparentAccounts:
            return "/transparentAccounts"
        case .getTransparentAccountDetails(let accountId):
            return "/transparentAccounts/\(accountId)"
        case .getTransparentAccountTransactions(let accountId):
            return "/transparentAccounts/\(accountId)/transactions"
        }
    }
}

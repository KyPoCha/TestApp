//
//  AccountListModel.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Foundation

public struct AccountListModel: Codable, Equatable {
    public let pageNumber: Int
    public let pageSize: Int
    public let pageCount: Int
    public let recordCount: Int
    public let nextPage: Int
    public let accounts: [AccountDetailModel]
}

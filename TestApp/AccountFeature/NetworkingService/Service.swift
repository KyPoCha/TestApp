//
//  Service.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Foundation

public struct Service: ServiceProtocol {
    private let baseUrl: String = "https://webapi.developers.erstegroup.com/api/csas/public/sandbox/v3"
    private let apiKey: String = "871afc23-018a-4abe-af8e-b5f757e5c45c"
    private let decoder: JSONDecoder = .init()

    public func getTransparentAccounts(page: Int) async throws -> AccountListModel {
        guard let url = URL(string: baseUrl + ServiceProvider.getTransparentAccounts.path) else {
            throw ServiceError.invalidURL()
        }
        
        let pageQueryItem = URLQueryItem(name: "page", value: "\(page)")
        
        return try await performRequest(url: url, query: [pageQueryItem])
    }

    public func getTransparentAccountDetails(accountId: String) async throws -> AccountDetailModel {
        guard let url = URL(string: baseUrl + ServiceProvider.getTransparentAccountDetails(accountId: accountId).path) else {
            throw ServiceError.invalidURL()
        }
        return try await performRequest(url: url)
    }

    public func getTransparentAccountTransactions(accountId: String) async throws -> AccountTransactionListModel {
        guard let url = URL(string: baseUrl + ServiceProvider.getTransparentAccountTransactions(accountId: accountId).path) else {
            throw ServiceError.invalidURL()
        }

        return try await performRequest(url: url)
    }

    private func performRequest<T: Decodable>(url: URL, query: [URLQueryItem] = []) async throws -> T {
        var request = URLRequest(url: url)

        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "WEB-API-key")
        
        request.url?.append(queryItems: query)

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            let responseCode = (response as? HTTPURLResponse)?.statusCode ?? 0

            if (200 ..< 300).contains(responseCode) {
                let responseData = try decoder.decode(T.self, from: data)
                return responseData
            } else {
                throw ServiceError.invalidResponse(description: "ERROD | Invalid response code: \(responseCode)")
            }
        } catch {
            throw error
        }
    }
}

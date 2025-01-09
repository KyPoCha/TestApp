//
//  ServiceError.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Foundation

public enum ServiceError: Error {
    case invalidResponse(description: String = "API ERROR | Invalid response")
    case invalidData(description: String = "API ERROR | Invalid data")
    case invalidURL(description: String = "API ERROR | Invalid URL")
    case invalidHTTPStatus(description: String = "API ERROR | Invalid HTTP status")
}

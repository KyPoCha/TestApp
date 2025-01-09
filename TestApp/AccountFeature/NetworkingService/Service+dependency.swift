//
//  Service+dependency.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Foundation
import ComposableArchitecture

struct ServiceKey: DependencyKey {
    static var liveValue: ServiceProtocol = Service()
}

extension DependencyValues {
    var service: ServiceProtocol {
        get { self[ServiceKey.self] }
        set { self[ServiceKey.self] = newValue }
    }
}

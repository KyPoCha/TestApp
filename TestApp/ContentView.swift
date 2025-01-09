//
//  ContentView.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import ComposableArchitecture
import SwiftUI

struct ContentView: View {
    var body: some View {
        AccountListView(store: .init(initialState: .init(),
                                     reducer: {
                                         AccountListDomain()
                                     }))
    }
}


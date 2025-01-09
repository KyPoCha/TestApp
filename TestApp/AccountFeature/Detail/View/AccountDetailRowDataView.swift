//
//  AccountDetailRowDataView.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import SwiftUI

public struct AccountDetailRowDataView: View {
    private let title: String
    private let value: String

    public init(title: String,
                value: String) {
        self.title = title
        self.value = value
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)

            HStack {
                Text(value)
                    .font(.headline)
                
                Spacer()
            }
        }
    }
}

#Preview {
    AccountDetailRowDataView(title: "Account Number", value: "000000-2906478309")
}

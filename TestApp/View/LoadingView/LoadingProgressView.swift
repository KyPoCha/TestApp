//
//  LoadingProgressView.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import SwiftUI

public struct LoadingProgressView: View {
    public var body: some View {
        ProgressView()
            .progressViewStyle(
                CircularProgressViewStyle(tint: .white)
            )
            .scaleEffect(x: 2, y: 2, anchor: .center)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(.black.opacity(0.7))
                    .frame(width: 80, height: 80)
            )
    }
}

#Preview {
    LoadingProgressView()
}

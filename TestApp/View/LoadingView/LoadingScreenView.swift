//
//  LoadingScreenView.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import SwiftUI

public struct LoadingScreenView: ViewModifier {
    private var isShowing: Bool

    public init(isShowing: Bool) {
        self.isShowing = isShowing
    }

    public func body(content: Content) -> some View {
        ZStack {
            content
            if isShowing {
                loadingView
            }
        }
    }

    private var loadingView: some View {
        GeometryReader { _ in
            ZStack {
                Color.white.opacity(0.1)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                LoadingProgressView()
            }
        }
        .ignoresSafeArea()
        .transition(.opacity.animation(.easeInOut(duration: 0.5)))
    }
}

#Preview {
    @Previewable @State var isLoading = true
    VStack {
        Text("Loading Screen Example")
            .loadingIndicator(isLoading)
    }
    .onAppear {
        Task {
            try? await Task.sleep(for: .seconds(2))
            isLoading = false
        }
    }
}

public extension View {
    func loadingIndicator(_ isShowing: Bool) -> some View {
        self.modifier(LoadingScreenView(isShowing: isShowing))
    }
}

//
//  SwiftUIView.swift
//  YumeTheWizard
//
//  Created by Larissa Okabayashi on 29/01/25.
//

import SwiftUI

struct FlowerView: View {
    @State private var flowerFrame = 0
    private var flowerFrames = ["image 309", "image 310"]
    var body: some View {
        Image(flowerFrames[flowerFrame])
            .resizable()
            .frame(width: 330, height: 216)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
                    DispatchQueue.main.async {
                        flowerFrame = (flowerFrame + 1) % flowerFrames.count
                    }
                }
            }
    }
}

#Preview {
    FlowerView()
}

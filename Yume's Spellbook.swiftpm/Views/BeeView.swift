//
//  SwiftUIView.swift
//  YumeTheWizard
//
//  Created by Larissa Okabayashi on 29/01/25.
//

import SwiftUI

struct BeeView: View {
    @State private var beeFrame = 0
    private var beeFrames = ["image 302", "image 303", "image 304", "image 305", "image 306", "image 307", "image 308"]
    var body: some View {
        Image(beeFrames[beeFrame])
            .resizable()
            .frame(width: 160, height: 160)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                    DispatchQueue.main.async {
                        beeFrame = (beeFrame + 1) % beeFrames.count
                    }
                }
            }
    }
}

#Preview {
    BeeView()
}

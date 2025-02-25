//
//  wordsview.swift
//  YumeTheWizard
//
//  Created by Larissa Okabayashi on 04/02/25.
//

import SwiftUI

struct WordsView: View {
    @State private var wordsFrame = 0
    private var wordsFrames = ["words2", "words3"]
    var body: some View {
        Image(wordsFrames[wordsFrame])
            .resizable()
            .frame(width: 320, height: 70)
            .offset(x: 5, y: 100)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { _ in
                    DispatchQueue.main.async {
                        wordsFrame = (wordsFrame + 1) % wordsFrames.count
                    }
                }
            }
    }
}


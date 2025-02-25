//
//  CaudronView.swift
//  YumeTheWizard
//
//  Created by Larissa Okabayashi on 30/01/25.
//

import SwiftUICore
import SwiftUI

struct CaudronView: View {
    private let caudronFrames = ["image 339", "image 340", "image 341", "image 342", "image 343"]
    
    @State private var caudronFrame = 0
    @State private var navigateToNextView = false
    
    // Timer publisher that runs every 0.1s on the main thread
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationStack {
            Image(caudronFrames[caudronFrame])
                .onAppear {
                    AudioManager.shared.playSoundEffect(named: "bubbles")
                }
                .onReceive(timer) { _ in
                    if caudronFrame < caudronFrames.count - 1 {
                        caudronFrame += 1
                    } else {
                        timer.upstream.connect().cancel() // Stop the timer
                        
                        // Small delay before navigating
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            navigateToNextView = true
                        }
                    }
                }
                .navigationDestination(isPresented: $navigateToNextView) {
                    ExplicationView()
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                }
                
                
        }
    }
}

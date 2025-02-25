//
//  SwiftUIView.swift
//  YumeTheWizard
//
//  Created by Larissa Okabayashi on 29/01/25.
//

import SwiftUI

struct CloudView: View {
    @State private var cloudFrame = 0
    private var cloudFrames = ["cloud 1", "cloud 2", "cloud 3", "cloud 4", "cloud 5", "cloud 6", "cloud 7", "cloud 8",]
    
    var body: some View {
        VStack{
            Image(cloudFrames[cloudFrame])
                .resizable()
                .frame(width: getWidth(), height: getHeight()/3)
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
                        DispatchQueue.main.async {
                            cloudFrame = (cloudFrame + 1) % cloudFrames.count
                        }
                    }
                }
            Image(cloudFrames[cloudFrame])
                .resizable()
                .frame(width: getWidth(), height: getHeight()/3)
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
                        DispatchQueue.main.async {
                            cloudFrame = (cloudFrame + 1) % cloudFrames.count
                        }
                    }
                }
            Image(cloudFrames[cloudFrame])
                .resizable()
                .frame(width: getWidth(), height: getHeight()/3)
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
                        DispatchQueue.main.async {
                            cloudFrame = (cloudFrame + 1) % cloudFrames.count
                        }
                    }
                }
        }
    }
}

#Preview {
    CloudView()
}

//
//  SwiftUIView.swift
//  YumeTheWizard
//
//  Created by Larissa Okabayashi on 03/02/25.
//

import SwiftUI

struct AdviceView: View {
    @State var b2b: Bool = false
    var body: some View {
        ZStack{
            Image("blackandwhite")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Image("explicationyume")
    
            Text("""
    This model is just the beginning! There's still plenty of room to grow and improve. Remember, training a language model isn’t about using more data — it’s about using the right data. Quality, diversity, and relevance matter far more than sheer quantity. Keep casting wisely!
    """)
            .font(.system(size: 20, design: .rounded))
            .frame(width: 270)
            .foregroundStyle(.black)
            .offset(x: 0, y: 100)
            .multilineTextAlignment(.center)
            
            Button {
                b2b.toggle()
            }
            label: {
                ZStack{
                    Image("arrow")
                        .resizable()
                        .frame(width: 80, height: 40)
                }
            }
            .offset(x: 120, y: 230)
            .navigationDestination(isPresented: $b2b){
                InitView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    AdviceView()
}

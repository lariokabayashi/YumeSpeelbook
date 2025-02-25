//
//  Explication.swift
//  YumeTheWizard
//
//  Created by Larissa Okabayashi on 30/01/25.
//

import SwiftUI

struct ExplicationView: View {
    @State var goNextPage: Bool = false
    @State var text = """
The spell's training work as follows :
1. Input Data: Text is tokenized into smaller units (e.g., words) for processing.
"""
    @State var parametersText = """
P1 = 1
P2 = 1
P3 = 1
P4 = 1
P5 = 1
P6 = 1
P7 = 1
Ect.
"""
    @State var page = 0
    var body: some View {
        
        ZStack{
            Image("blackandwhite")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            if page == 0{
                
                Image("explication2")
                
                Image("words")
                    .resizable()
                    .frame(width: 330, height: 100)
                    .offset(x: 0, y: 100)
                
                Text(text)
                    .font(.system(size: 24, design: .rounded))
                    .frame(width: 300)
                    .foregroundStyle(.black)
                    .offset(x: 0, y: -130)
                
                Button {
                    text = """
2. Initialization: Model parameters (weights) start with random values.
"""
                    page += 1
                }
                label: {
                    ZStack{
                        Image("arrow")
                            .resizable()
                            .frame(width: 80, height: 40)
                    }
                }
                .offset(x: 130, y: 210)
            }
            
            else if page == 1{
                
                Image("explication2")
                
                
                Text(text)
                    .font(.system(size: 24, design: .rounded))
                    .frame(width: 300)
                    .foregroundStyle(.black)
                    .offset(x: 0, y: -150)
                
                Text(parametersText)
                    .font(.system(size: 24, design: .rounded))
                    .bold()
                    .frame(width: 320)
                    .foregroundStyle(.black)
                    .offset(x: -100, y: 120)
                
                Button {
                    text = """
3. Prediction: The model predicts the next token based on input 
"""
                    page += 1
                }
                label: {
                    ZStack{
                        Image("arrow")
                            .resizable()
                            .frame(width: 80, height: 40)
                    }
                }
                .offset(x: 130, y: 210)
            }
            else if page == 2{
                    
                Image("explication2")
                
                Image("words2")
                    .resizable()
                    .frame(width: 320, height: 70)
                    .offset(x: 5, y: 100)
                
                Text(text)
                    .font(.system(size: 24, design: .rounded))
                    .frame(width: 300)
                    .foregroundStyle(.black)
                    .offset(x: 0, y: -150)
                
                Button {
                    text = """
4. Loss Calculation: The prediction is compared to the actual token, and the error is measured using a loss function.
"""
                    page += 1
                }
                label: {
                    ZStack{
                        Image("arrow")
                            .resizable()
                            .frame(width: 80, height: 40)
                    }
                }
                .offset(x: 130, y: 210)
            }
            else if page == 3{
                Image("explication2")
                
                WordsView()
                
                Text(text)
                    .font(.system(size: 24, design: .rounded))
                    .frame(width: 300)
                    .foregroundStyle(.black)
                    .offset(x: 0, y: -140)
                
                
                Button {
                    text = """
                    5. Parameters are adjusted via optimization to minimize the loss. This process is repeated across the dataset to improve predictions.
                    """
                    parametersText = """
                    P1 = 1
                    P2 = 1
                    P3 = 12
                    P4 = 1
                    P5 = 1
                    P6 = -4
                    P7 = 1
                    Ect.
                    """
                    page += 1
                }
                label: {
                    ZStack{
                        Image("arrow")
                            .resizable()
                            .frame(width: 80, height: 40)
                    }
                }
                .offset(x: 130, y: 210)
            }
            else if page == 4{
                Image("explication2")
                
                
                Text(text)
                    .font(.system(size: 24, design: .rounded))
                    .frame(width: 300)
                    .foregroundStyle(.black)
                    .offset(x: 0, y: -140)
                
                Text(parametersText)
                    .font(.system(size: 24, design: .rounded))
                    .bold()
                    .frame(width: 320)
                    .foregroundStyle(.black)
                    .offset(x: -100, y: 120)
                
                Button {
                    text = """
                    Now let's use this magic with my book of enchantments!
                    """
                    page += 1
                }
                label: {
                    ZStack{
                        Image("arrow")
                            .resizable()
                            .frame(width: 80, height: 40)
                    }
                }
                .offset(x: 130, y: 210)
            }
            else if page == 5{
                Image("explicationyume")
                
                Text(text)
                    .font(.system(size: 24, design: .rounded))
                    .frame(width: 280)
                    .foregroundStyle(.black)
                    .offset(x: 0, y: 100)
                    .multilineTextAlignment(.center)
                
                Button {
                    goNextPage.toggle()
                }
                label: {
                    ZStack{
                        Image("arrow")
                            .resizable()
                            .frame(width: 80, height: 40)
                    }
                }
                .offset(x: 130, y: 210)
                .navigationDestination(isPresented: $goNextPage){
                    ContentView()
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                }
            }
        }
    }
}

#Preview {
    ExplicationView()
}

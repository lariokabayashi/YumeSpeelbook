//
//  SwiftUIView.swift
//  YumeTheWizard
//
//  Created by Larissa Okabayashi on 29/01/25.
//

import SwiftUI

struct CommentView: View {
    @State private var showingNextPage = false
    @State var page = 0
    @State var text = "Hello, I’m Yume! Today, I have another Machine Learning mystery for you"
    var body: some View {
        ZStack {
            // Background Sky
            Image("background")
                .resizable()
                .frame(width: getWidth(), height: 2*getHeight())
                .ignoresSafeArea()
                .scaledToFill()
            
            CloudView()
            
            VStack{
                ZStack {
                    // Island base
                    Image("floating island")
                        .resizable()
                        .frame(width: getWidth(), height: getHeight()/1.5)
                        .position(x: getWidth()/2, y: getHeight()/1)
                    
                    // Character
                    Image("kiki-in-front")
                        .resizable()
                        .frame(width: 96, height: 140)
                        .position(x: getWidth()/2, y: getHeight()/1.2)
                    
                    
                    Image("tree")
                        .resizable()
                        .frame(width: 160, height: 256)
                        .position(x: 50, y: getHeight()/1.25)
                    
                    FlowerView()
                        .position(x: getWidth()/1.2, y: getHeight()/1.2)
                    
                    BeeView()
                        .position(x: getWidth()/1.2, y: getHeight()/1.4)
                }
                
                
                ZStack{
                    Image("Comment")
                        .resizable()
                        .frame(width: 400, height: 180)
                        .position(x: getWidth()/2, y: getHeight()/2.6)
                    Text(text)
                        .font(Font.custom("Pixelify Sans", size: 20))
                        .frame(width: 320)
                        .foregroundStyle(.black)
                        .position(x: getWidth()/1.9, y: getHeight()/2.55)
                    Button {
                        page += 1
                        if page == 1{
                            text = "I need your help to create a powerful spell"
                        }
                        else if page == 2{
                            text = "A language model  that can predict words and help me complete the missing parts of my enchantments."
                        }
                        else{
                            showingNextPage.toggle()
                        }
                    }
                    label: {
                        ZStack{
                            Image("arrow")
                                .resizable()
                                .frame(width: 80, height: 40)
                        }
                    }
                    .position(x: getWidth()/1.2, y: getHeight()/2.3)
                }
                .navigationDestination(isPresented: $showingNextPage) {
                    CollectView()
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                }
            }
        }
    }
}

#Preview {
    CommentView()
}

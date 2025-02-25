//
//  InitView.swift
//  YumeTheWizard
//
//  Created by Larissa Okabayashi on 27/01/25.
//

import SwiftUI

struct InitView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background Sky
                Image("background")
                    .resizable()
                    .frame(width: getWidth(), height: 2*getHeight())
                    .ignoresSafeArea()
                    .scaledToFill()
                
                CloudView()
                
                VStack (spacing: 0){
                    
                    ButtonView()
                    
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
                }
            }
        }
    }
}

struct ButtonView: View {
    @State private var showingSheet = false
    @State private var showingComments = false
     
    var body: some View{
        VStack {
            Button {
                showingComments.toggle()
            } label: {
                ZStack {
                    Image("button")
                        .resizable()
                        .frame(width: 278, height: 62)
                    Text("Play")
                        .font(Font.custom("Pixelify Sans", size: 18))
                }
            }
            .offset(x: 0, y: 550)
            .navigationDestination(isPresented: $showingComments) {
                CommentView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
            }
            
            
            Button {
                showingSheet.toggle()
            }
            label: {
                ZStack{
                    Image("button")
                        .resizable()
                        .frame(width: 278, height: 62)
                    Text("About The Author")
                        .font(Font.custom("Pixelify Sans", size: 18))
                }
            }
            .offset(x:0, y:555)
            .sheet(isPresented: $showingSheet) {
                SheetAuthorView()
            }
        }
    }
}
struct AnimatedSceneView_Previews: PreviewProvider {
    static var previews: some View {
        InitView()
    }
}

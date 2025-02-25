//
//  SwiftUIView.swift
//  YumeTheWizard
//
//  Created by Larissa Okabayashi on 29/01/25.
//

import SwiftUI

struct CollectView: View {
    @State var showingCrystal = true
    @State var showingAnimation = false
    @State var showingCrystalCard = false
    @State var showingBooks = true
    @State var showingBooksCard = false
    @State var showingPaper = true
    @State var showingPaperCard = false
    @State var collectedObjects = 0
    @State var text = "First, let’s gather the essential ingredients to build the language model:"
    var body: some View {
        VStack{
            ZStack{
                // Background Sky
                Image("background")
                    .resizable()
                    .frame(width: getWidth(), height: 2*getHeight())
                    .ignoresSafeArea()
                    .scaledToFill()
                
                CloudView()
                
                Image("path")
                    .resizable()
                    .frame(width: getWidth(), height: getHeight()/1.5)
                    .position(x: getWidth()/2, y: getHeight()/1.1)
                
                FlowerView()
                    .position(x: getWidth()/1.3, y: getHeight()/1.5)
                
                BeeView()
                    .position(x: getWidth()/1.2, y: getHeight()/1.8)
                
                Button {
                    showingPaper.toggle()
                    showingPaperCard.toggle()
                    collectedObjects+=1
                    text = "The **cooking rules**— temperature and mixing time—represent what we call **Hyperparameters**."
                    AudioManager.shared.playSoundEffect(named: "select")
                }
                label: {
                    if showingPaper{
                        Image("paper")
                            .contentShape(Rectangle())
                    }
                }
                .position(x: getWidth()/3.5, y:getHeight()/1.25)
                
                Image("madeira")
                    .position(x: getWidth()/1.2, y:getHeight()/0.9)
                
                Image("rock")
                    .position(x: getWidth()/3, y:getHeight()/0.9)
                
                Button {
                    showingCrystal.toggle()
                    showingCrystalCard.toggle()
                    collectedObjects+=1
                    text = "The **Power of Magic** (computation) will process everything."
                    AudioManager.shared.playSoundEffect(named: "select")
                }
                label: {
                    if showingCrystal {
                        Image("crystal")
                            .contentShape(Rectangle()) // Restricts touchable area
                    }
                }
                .position(x: getWidth()/4, y:getHeight()/0.9)
                
                // Character
                Image("kiki-in-front")
                    .resizable()
                    .frame(width: 96, height: 140)
                    .position(x: getWidth()/2, y: getHeight()/1.2)
                
                
                Image("tree")
                    .resizable()
                    .frame(width: 120, height: 220)
                    .position(x: getWidth()/5, y: getHeight()/1.55)
                
                Button {
                    if collectedObjects == 3{
                        showingAnimation.toggle()
                    }
                }
                label: {
                    Image("image 339")
                        .contentShape(Rectangle().size(width: 10, height: 10))
                }
                .position(x: getWidth()/2, y:getHeight()/1.05)
                
                
                
                Button{
                    showingBooks.toggle()
                    showingBooksCard.toggle()
                    collectedObjects+=1
                    text = "The **raw ingredients** are texts from books, articles, and conversations that will serve as data."
                    AudioManager.shared.playSoundEffect(named: "select")
                }
                label: {
                    if showingBooks {
                        Image("books")
                            .contentShape(Rectangle())
                    }
                }
                .position(x: getWidth()/1.2, y:getHeight()/0.94)
                
                
                
                Image("Comment")
                    .resizable()
                    .frame(width: 400, height: 180)
                    .position(x: getWidth()/2, y: getHeight()/0.72)
                Text(text)
                    .font(Font.custom("Pixelify Sans", size: 20))
                    .frame(width: 320)
                    .foregroundStyle(.black)
                    .position(x: getWidth()/1.9, y: getHeight()/0.715)
                
                Button {
                    showingBooksCard = false
                    showingPaperCard = false
                    showingCrystalCard = false
                
                    if collectedObjects == 3{
                        text = "Now that we have everything ready, click the cauldron to see the magic unfold!"
                    }
                    else{
                        text = "Continue to gather the essential ingredients to build the language model"
                    }
                }
                label: {
                    ZStack{
                        Image("arrow")
                            .resizable()
                            .frame(width: 80, height: 40)
                    }
                }
                .position(x: getWidth()/1.2, y: getHeight()/0.69)
                
                if showingCrystalCard{
                    Image("CardCrystal")
                        .position(x:getWidth()/1.85, y:getHeight()/1.1)
                }
                else if showingBooksCard{
                    Image("CardBook")
                        .position(x:getWidth()/1.85, y:getHeight()/1.1)
                }
                else if showingPaperCard{
                    Image("CardPaper")
                        .position(x:getWidth()/2, y:getHeight()/1.1)
                }
                if showingAnimation{
                    CaudronView()
                        .position(x: getWidth()/2, y:getHeight()/1.05)
                }
            }
        }
    }
}

#Preview {
    CollectView()
}

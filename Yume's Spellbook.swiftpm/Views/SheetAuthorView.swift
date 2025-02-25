//
//  SwiftUIView.swift
//  YumeTheWizard
//
//  Created by Larissa Okabayashi on 29/01/25.
//

import SwiftUI

struct SheetAuthorView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack{
            
            Image("MeetTheAuthor2")
                .resizable()
                .scaledToFill()
            
            Button(action: {
                dismiss.callAsFunction()
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundStyle(.gray)
            })
            .position(x:30, y:80)
            
            
        }
    }
        
}

#Preview {
    SheetAuthorView()
}

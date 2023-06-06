//
//  Nickname.swift
//  MacUnforger
//
//  Created by MacBook Pro on 06/06/23.
//

import SwiftUI

struct Nickname: View {
    @Binding var nickname: String
    var nextAction: () -> Void
    let imagesHero: [String] = ["assassin_model", "mage_model", "warrior_model"]
    
    var body: some View {
        VStack{
        Image("The_Unforger")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 150)
        LazyVGrid(columns: [
            GridItem(.flexible(), spacing: 8),
            GridItem(.flexible(), spacing: 8),
            GridItem(.flexible(), spacing: 8)
        ], spacing: 8) {
            ZStack {
                Image(imagesHero[0])
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .alignmentGuide(.top) { _ in
                        0 // Align to the top
                    }
                Color.clear // Placeholder to maintain grid layout
            }
            
            GeometryReader { geometry in
                ZStack {
                    Image(imagesHero[1])
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2 + 90) // Adjust the y value to position it lower
                        .alignmentGuide(.top) { _ in
                            0 // Align to the top
                        }
                    Color.clear // Placeholder to maintain grid layout
                }
            }
            
            ZStack {
                Image(imagesHero[2])
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .alignmentGuide(.top) { _ in
                        0 // Align to the top
                    }
                Color.clear // Placeholder to maintain grid layout
            }
        }
        .padding()
    }
            Text("Let us know your name, adventurer")
                .font(.system(size: 19))
                .padding(.top, 30)
            VStack {
                TextField("Insert Nickname", text: $nickname)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 45)
                    .foregroundColor(Color.orange)

                Button(action: nextAction) {
                    Text("Confirm")
                        .foregroundColor(.white)
                        .padding(.horizontal, 35)
                        .padding(.vertical, 5)
                        .background(Color.blue)
                        .cornerRadius(100)
                }
                .padding()

                Spacer()
            }
        }
    }

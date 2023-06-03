//
//  BattleView.swift
//  Unforger
//
//  Created by MacBook Pro on 02/06/23.
//
import SwiftUI

struct BattleView: View {
    var body: some View {
           VStack {
               // Banner at the top
               Text("Banner")
                   .font(.largeTitle)
                   .frame(maxWidth: .infinity)
                   .padding()
                   .background(Color.blue)
                   .foregroundColor(.white)
               
               Spacer()
               
               // Centered Content
               VStack {
                   // Dialog Box
                   VStack(alignment: .leading, spacing: 10) {
                       HStack(alignment: .top) {
                           Image("assassin")
                               .resizable()
                               .aspectRatio(contentMode: .fit)
                               .frame(width: 180, height: 100)
                           
                           Text("I will end your carreer monster!!")
                               .padding(.vertical)
                       }
                       .padding()
                       .background(Color.white)
                       .cornerRadius(10)
                       .shadow(radius: 5)
                       
                       Spacer()
                       
                       Text("Choose your next move!!")
                           .font(.title)
                           .foregroundColor(.black)
                       
                       Spacer()
                       
                       // Buttons
                       VStack(spacing: 10) {
                           ForEach(1...5, id: \.self) { index in
                               Button(action: {
                                   // Action for each button
                               }) {
                                   Text("Button \(index)")
                                       .foregroundColor(.white)
                                       .padding()
                                       .frame(maxWidth: .infinity)
                                       .background(Color.blue)
                                       .cornerRadius(10)
                               }
                           }
                       }
                       .frame(maxWidth: .infinity)
                       .padding()
                       .background(Color.gray.opacity(0.2))
                       .cornerRadius(10)
                       .padding()
                   }
               }
               
               Spacer()
           }
       }
   }

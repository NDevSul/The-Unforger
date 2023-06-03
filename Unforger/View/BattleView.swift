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
                   VStack(alignment: .leading) {
                       
                       HStack(alignment: .top) {
                           Spacer()
                           
                           Image("assassin_model")
                               .resizable()
                               .aspectRatio(contentMode: .fill)
                               .frame(width: 180, height: 100)
                               .padding()
                               .background(Color.customBackground)
                           
                           Spacer()
                           
                           Text("I will end your career, monster!!")
                               .padding(.vertical)
                           Spacer()
                       }
                       .padding()
                       .background(Color.white)
                       .cornerRadius(10)
                       .shadow(radius: 5)
                       
                       Spacer()
                   }
                   
                //buttons
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
   


struct BattleView_Previews: PreviewProvider {
    static var previews: some View {
        BattleView()
    }
}

//
//  NicknameView.swift
//  Unforger
//
//  Created by MacBook Pro on 01/06/23.
//

import SwiftUI

struct NicknameView: View {
    @Binding var nickname: String
    var nextAction: () -> Void
    
    var body: some View {
        Text("Let us know your name, adventurer")
            .font(.subheadline)
        VStack {
            TextField("Insert Nickname", text: $nickname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 45)
            
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

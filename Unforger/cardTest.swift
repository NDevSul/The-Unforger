//
//  cardTest.swift
//  Unforger
//
//  Created by MacBook Pro on 05/06/23.
//

import SwiftUI

struct cardTest: View {
    
    var body: some View {
            VStack {
                // Player 1 information
                HStack {
                    Image("assasin_atk_1")
                        .resizable()
                        .frame(width: 100, height: 50)
                    
                    VStack(alignment: .leading) {
                        Text("Player 1")
                            .font(.title)
                            .foregroundColor(.blue)
                        Text("Health: 100")
                            .foregroundColor(.green)
                        Text("Mana: 50")
                            .foregroundColor(.orange)
                    }
                    
                    Spacer()
                }
                
                Divider() // Optional divider line
                
                // Player 2 information
                HStack {
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("Enemy")
                            .font(.title)
                            .foregroundColor(.red)
                        Text("Health: 80")
                            .foregroundColor(.green)
                    }
                    
                    Image("assasin_atk_1")
                        .resizable()
                        .frame(width: 100, height: 50)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .frame(width: 300, height: 120)

        }
}

struct cardTest_Previews: PreviewProvider {
    static var previews: some View {
        cardTest()
    }
}

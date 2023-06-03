//
//  DialogView.swift
//  Unforger
//
//  Created by MacBook Pro on 01/06/23.
//

import SwiftUI

struct OpeningDialogueCard: View {
    let imageName: String
    let text: String
    let buttonTitle: String
    let buttonAction: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                
                Text(text)
                    .padding()
            }
            
            Button(action: {
                buttonAction()
            }) {
                Text(buttonTitle)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
    }
}

struct OpeningDialogueCard_Previews: PreviewProvider {
    static var previews: some View {
        OpeningDialogueCard(imageName: "", text: "", buttonTitle: "", buttonAction: {})
    }
}

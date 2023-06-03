//
//  OpeningDialogue.swift
//  Unforger
//
//  Created by MacBook Pro on 03/06/23.
//

import SwiftUI

struct OpeningDialogue: View {
    @State private var showDialogs: [Bool] = []
    
    var dialogs: [(imageName: String, text: String, nextDialogButtonTitle: String)] = [
        ("assassin", "Dialog One Text", ""),
        ("logo", "Dialog Two Text", "")
        // Add more dialog data here
    ]
    
    var body: some View {
        VStack {
            
            if showDialogs.count <= dialogs.count {
                ForEach(0..<showDialogs.count, id: \.self) { index in
                    OpeningDialogueCard(imageName: dialogs[index].imageName,
                               text: dialogs[index].text,
                               buttonTitle: dialogs[index].nextDialogButtonTitle) {
                        showDialogs.remove(at: index)
                        if index < dialogs.count - 1 {
                            showDialogs.append(true)
                        }
                    }
                }
                Button(action: {
                    showDialogs.append(true)
                }) {
                    Text("Next")
                }
            }else{
                
                BattleView()
                
            }
        }
    }
}

struct OpeningDialogue_Previews: PreviewProvider {
    static var previews: some View {
        OpeningDialogue()
    }
}

//
//  ContentView.swift
//  Unforger
//
//  Created by MacBook Pro on 26/05/23.
//

import SwiftUI

struct RegisterView: View {
    @State private var playerModel = Player(nickname: "", isShowingProfile: false)
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.customBackground
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("")
                    if !playerModel.isShowingProfile {
                        NicknameView(nickname: $playerModel.nickname, nextAction: { playerModel.isShowingProfile = true })
                    } else if playerModel.selectedRole == nil {
                        RoleSelectionView(selectedRole: $playerModel.selectedRole, confirmAction: { role in
                            playerModel.selectedRole = role
                            playerModel.isShowingProfile = true
                        })
                    } else {
                        ProfileView(nickname: playerModel.nickname, selectedRole: playerModel.selectedRole)
                    }
                }
                .navigationTitle("The Unforger")
            }
            
        }
    }
}
    
    struct RegisterView_Previews: PreviewProvider {
        static var previews: some View {
            RegisterView()
        }
    }
    
    extension Color {
        static let customBackground = Color(hue: 0.115, saturation: 0.568, brightness: 0.986)
    }

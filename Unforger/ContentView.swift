//
//  ContentView.swift
//  Unforger
//
//  Created by MacBook Pro on 26/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var nickname: String = ""
    @State private var selectedRole: String?
    @State private var isShowingProfile: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.customBackground
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    if !isShowingProfile {
                        NicknameView(nickname: $nickname, nextAction: { isShowingProfile = true })
                    } else if selectedRole == nil {
                        RoleSelectionView(selectedRole: $selectedRole, confirmAction: { role in
                            selectedRole = role
                            isShowingProfile = true
                        })
                    } else {
                        ProfileView(nickname: nickname, selectedRole: selectedRole!)
                    }
                }
            }
            .navigationTitle("The Unforger")
        }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    extension Color {
        static let customBackground = Color(hue: 0.115, saturation: 0.568, brightness: 0.986)
    }

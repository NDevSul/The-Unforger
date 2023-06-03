//
//  ProfileView.swift
//  Unforger
//
//  Created by MacBook Pro on 01/06/23.
//

import SwiftUI

struct ProfileView: View {
    var nickname: String
    var selectedRole: String?
    
    var body: some View {
        VStack {
            Text("Profile")
                .font(.title)
            
            Spacer()
            
            if selectedRole == "Mage" {
                Image("mage_role")
            } else if selectedRole == "Assassin" {
                Image("assassin_role")
            } else {
                Image("fighter_role")
            }
            
            
            Spacer()
            
            Text("Nickname: \(nickname)")
                .font(.headline)
            
            if let role = selectedRole {
                            Text("Role: \(role)")
                                .font(.headline)
                        }
            
//            Text("Role: \(selectedRole)")
//                .font(.headline)
            
            Spacer()
        }
    }
}


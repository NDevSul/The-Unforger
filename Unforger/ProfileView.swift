//
//  ProfileView.swift
//  Unforger
//
//  Created by MacBook Pro on 01/06/23.
//

import SwiftUI

struct ProfileView: View {
    var nickname: String
    var selectedRole: String
    
    var body: some View {
        VStack {
            Text("Profile")
                .font(.title)
            
            Spacer()
            
            Text("Nickname: \(nickname)")
                .font(.headline)
            
            Text("Role: \(selectedRole)")
                .font(.headline)
            
            Spacer()
        }
    }
}


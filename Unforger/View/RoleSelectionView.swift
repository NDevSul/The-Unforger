//
//  RoleSelectionView.swift
//  Unforger
//
//  Created by MacBook Pro on 01/06/23.
//

import SwiftUI

struct RoleSelectionView: View {
    @Binding var selectedRole: String
    var confirmAction: (String) -> Void
    
    var body: some View {
        VStack {
            Text("Pick your role")
                .font(.title)
            
            HStack(spacing: 30) {
                RoleButton(role: "Mage", imageName: "mage_role", selectedRole: $selectedRole, confirmAction: confirmAction)
                RoleButton(role: "Assassin", imageName: "assassin_role", selectedRole: $selectedRole, confirmAction: confirmAction)
                RoleButton(role: "Fighter", imageName: "fighter_role", selectedRole: $selectedRole, confirmAction: confirmAction)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct RoleButton: View {
    var role: String
    var imageName: String
    @Binding var selectedRole: String
    var confirmAction: (String) -> Void
    
    var body: some View {
        Button(action: {
            selectedRole = role
            confirmAction(role)
        }) {
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 60, height: 60)
                
                Text(role)
                    .font(.headline)
            }
        }
        .foregroundColor(selectedRole == role ? .blue : .gray)
    }
}


struct RoleSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        BattleView()
    }
}

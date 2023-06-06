//
//  RoleSelectionView.swift
//  Unforger
//
//  Created by MacBook Pro on 01/06/23.
//

import SwiftUI

struct RoleSelectionView: View {
    @StateObject var playerViewModel: PlayerViewModel
    @ObservedObject var vm: BattleView.ViewModel
    @Binding var selectedRole: String
    var confirmAction: (String) -> Void
    
    @State private var navigateToBattleView = false // State variable to control navigation

    
    var body: some View {
        
        Image("The_Unforger")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 150)
        VStack {
            Text("Pick your role")
                .font(.title)
            
            HStack(spacing: 30) {
                RoleButton(playerViewModel: playerViewModel, vm: vm, role: "Mage", imageName: "mage_role", selectedRole: $vm.character.selectedRole) { role in
                    selectedRole = role
                    confirmAction(role)
                    vm.player = Mage()
                    navigateToBattleView = true
                }
                RoleButton(playerViewModel: playerViewModel, vm: vm, role: "Assassin", imageName: "assassin_role", selectedRole: $vm.character.selectedRole) { role in
                    selectedRole = role
                    confirmAction(role)
                    vm.player = Assasin()
                    navigateToBattleView = true
                }
                RoleButton(playerViewModel: playerViewModel, vm: vm, role: "Fighter", imageName: "fighter_role", selectedRole: $vm.character.selectedRole) { role in
                    selectedRole = role
                    confirmAction(role)
                    vm.player = Fighter()
                    navigateToBattleView = true
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct RoleButton: View {
    @StateObject var playerViewModel: PlayerViewModel
    @ObservedObject var vm: BattleView.ViewModel
    var role: String
    var imageName: String
    @Binding var selectedRole: String
    var confirmAction: (String) -> Void
    
    var body: some View {
        Button(action: {
            selectedRole = role
            confirmAction(role)
    let contentView = ContentView(playerViewModel: playerViewModel, vm: vm)// Create an instance of ContentView
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


//struct RoleSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        RoleSelectionView(vm: , selectedRole: <#T##Binding<String>#>, confirmAction: <#T##(String) -> Void#>)
//    }
//}

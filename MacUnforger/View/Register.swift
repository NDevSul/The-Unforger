//
//  Register.swift
//  MacUnforger
//
//  Created by MacBook Pro on 06/06/23.
//

import SwiftUI

struct Register: View {
    
    @StateObject var playerViewModel: PlayerViewModel
    @StateObject var roleVM: BattleView.ViewModel

    init(player: Player, enemy: Enemies) {
        let playerViewModel = PlayerViewModel(player: player)
        _playerViewModel = StateObject(wrappedValue: playerViewModel)
        
        let roleViewModel = BattleView.ViewModel(character: player, enemy: enemy)
        _roleVM = StateObject(wrappedValue: roleViewModel)
    }
    
//   @Published var playerModel = Player(nickname: "", selectedRole: nil, isShowingProfile: false, playerAttack: 10, playerHP: 100, playerMP: 50)
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.customBackground
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    if !playerViewModel.player.isShowingProfile {
                        Nickname(nickname: $playerViewModel.player.nickname, nextAction: { playerViewModel.player.isShowingProfile = true })
                    } else if playerViewModel.player.selectedRole == "" {
                        Role(vm: roleVM, selectedRole: $playerViewModel.player.selectedRole, confirmAction: { role in
                            playerViewModel.player.selectedRole = role
                            playerViewModel.player.isShowingProfile = true
                        })
                    } else {
                        BattleView(playerViewModel: playerViewModel, vm: roleVM)
//                        ProfileView(nickname: playerViewModel.player.nickname, selectedRole: playerViewModel.player.selectedRole, attack: playerViewModel.player.playerAttack, HP: playerViewModel.player.playerHP, MP: playerViewModel.player.playerMP)
                    }
                }
            }
            
        }
    }
}

    
//    struct RegisterView_Previews: PreviewProvider {
//        static var previews: some View {
//            RegisterView()
//        }
//    }
    
    extension Color {
        static let customBackground = Color(hue: 0.115, saturation: 0.568, brightness: 0.986)
    }

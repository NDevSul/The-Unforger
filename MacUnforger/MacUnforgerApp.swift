//
//  MacUnforgerApp.swift
//  MacUnforger
//
//  Created by MacBook Pro on 06/06/23.
//

import SwiftUI

@main
struct MacUnforgerApp: App {
    var body: some Scene {
        WindowGroup {
            let player = Player(nickname: "", selectedRole: "", isShowingProfile: false, playerAttack: 10, playerHP: 100, playerMP: 50, potion: 5)
//            BattleView(vm: BattleView.ViewModel(character: player))
            Splash()
        }
    }
}

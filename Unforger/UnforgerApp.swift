//
//  UnforgerApp.swift
//  Unforger
//
//  Created by MacBook Pro on 26/05/23.
//

import SwiftUI

@main
struct UnforgerApp: App {
    var body: some Scene {
        WindowGroup {
            let player = Player(nickname: "", selectedRole: "", isShowingProfile: false, playerAttack: 10, playerHP: 100, playerMP: 50, potion: 5)
            BattleView(vm: BattleView.ViewModel(character: player))
//            SplashScreen()
        }
    }
}

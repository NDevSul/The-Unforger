//
//  SplashScreen.swift
//  Unforger
//
//  Created by MacBook Pro on 04/06/23.
//

import SwiftUI

struct SplashScreen: View {
    let player = Player(nickname: "", selectedRole: "", isShowingProfile: false, playerAttack: 10, playerHP: 100, playerMP: 50, potion: 5)
    let enemy = Enemies(enemyName: "Villager")
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    // Customise your SplashScreen here
    var body: some View {
        if isActive {
            RegisterView(player: player, enemy: enemy)
        } else {
            VStack {
                VStack {
                    Image("The_Unforger")
                        .font(.system(size: 70))
                        .foregroundColor(.red)
                    
                    Text("")
                        .font(Font.custom("Baskerville-Bold", size: 26))
                        .foregroundColor(.black.opacity(0.80))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.4
                        self.opacity = 1.00
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

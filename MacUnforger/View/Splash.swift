//
//  Splash.swift
//  MacUnforger
//
//  Created by MacBook Pro on 06/06/23.
//

import SwiftUI

struct Splash: View {
    let player = Player(nickname: "", selectedRole: "", isShowingProfile: false, playerAttack: 10, playerHP: 100, playerMP: 50, potion: 5)
    
    let enemy = Enemies(enemyName: "Villager")
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    // Customise your SplashScreen here
    var body: some View {
        if isActive {
            Register(player: player, enemy: enemy)
        } else {
            VStack {
                VStack {
                    Image("Un")
                        .font(.system(size: 80))
                        .foregroundColor(.red)
                    
                    Text("")
                        .font(Font.custom("Baskerville-Bold", size: 26))
                        .foregroundColor(.black.opacity(0.80))
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 1
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


struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}

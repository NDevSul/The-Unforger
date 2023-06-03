//
//  BattleViewModel.swift
//  Unforger
//
//  Created by MacBook Pro on 04/06/23.
//

import Foundation


extension BattleView {
    class ViewModel: ObservableObject {
        private let animSpeed = 0.3
        @Published var playerCurrentAnim = "idle"
        @Published var playerCurrentAnimCount = 1
        
        @Published var opponentCurrentAnim = "idle"
        @Published var opponentCurrentAnimCount = 1
        
        @Published var player: Classable = Mage()
        @Published var opponent: Classable = Assasin()
        
        // mendisable spam karena tidak boleh
        @Published var disableControl = false
        
        
        private var timerPlayer: Timer?
        private var timerOpponent: Timer?
        
        func initAnimation() -> Void {
            self.togglePlayerIdleAnimation()
            self.toggleOpponentIdleAnimation()
        }
        
        func togglePlayerIdleAnimation(_ enabled: Bool = true) -> Void {
            if enabled {
                self.timerPlayer = Timer.scheduledTimer(withTimeInterval: self.animSpeed, repeats: true) { timer in
                    if self.playerCurrentAnimCount == self.player.idleAnimationCount {
                        self.playerCurrentAnimCount = 1
                    } else {
                        self.playerCurrentAnimCount += 1
                    }
                }
            } else {
                self.timerPlayer!.invalidate()
                self.timerPlayer = nil
                self.playerCurrentAnimCount = 1
            }
        }
        
        func toggleOpponentIdleAnimation(_ enabled: Bool = true) -> Void {
            if enabled {
                self.timerOpponent = Timer.scheduledTimer(withTimeInterval: self.animSpeed, repeats: true) { timer in
                    if self.opponentCurrentAnimCount == self.opponent.idleAnimationCount {
                        self.opponentCurrentAnimCount = 1
                    } else {
                        self.opponentCurrentAnimCount += 1
                    }
                }
            } else {
                self.timerOpponent!.invalidate()
                self.timerOpponent = nil
                self.opponentCurrentAnimCount = 1
            }
        }
        
        func contohAttackPlayer() -> Void {
            
            self.disableControl = true
            
            self.togglePlayerIdleAnimation(false) // matikan loop idle animasi
            self.playerCurrentAnim = "atk" // ganti ke animasi attack (hanya ada idle dan atk)
            var attackTimer: Timer? // buat timer attack
            
            // set timer attack dengan interval 0.1 detik per animasi
            attackTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                
                // apakah animasi sudah selesai (1 - n jumlah animasi)
                if self.playerCurrentAnimCount == self.player.attackAnimationCount {
                    
                    // matikan timer
                    attackTimer!.invalidate()
                    attackTimer = nil
                    
                    // kembalikan ke idle animation
                    self.disableControl = false
                    self.playerCurrentAnim = "idle"
                    self.togglePlayerIdleAnimation(true)
                } else {
                    
                    // habiskan attack animasi
                    self.playerCurrentAnimCount += 1
                    
                }
            }
            
        }
    }
}
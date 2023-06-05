//
//  BattleViewModel.swift
//  Unforger
//
//  Created by MacBook Pro on 04/06/23.
//

import Foundation


extension BattleView {
    class ViewModel: ObservableObject {
        
        @Published var character: Player
        @Published var enemy: Enemies
        init(character: Player, enemy: Enemies) {
            self.character = character
            self.enemy = enemy
        }
        
        
        private let animSpeed = 0.2
        
        
        
        @Published var playerCurrentAnim = "idle"
        @Published var playerCurrentAnimCount = 1
        
        @Published var opponentCurrentAnim = "idle"
        @Published var opponentCurrentAnimCount = 1
        
        @Published var player: Classable = Assasin()
        
        @Published var opponent: Classable = Enemy()
        
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
                self.timerPlayer?.invalidate()
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
        
        func doPlayerAttack(skill: Skills) -> Void {
            
            self.disableControl = true
            
            self.togglePlayerIdleAnimation(false) // matikan loop idle animasi
            self.playerCurrentAnim = "atk" // ganti ke animasi attack (hanya ada idle dan atk)
            var attackTimer: Timer?// buat timer attack
            
            // set timer attack dengan interval 0.1 detik per animasi
            attackTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                
                // apakah animasi sudah selesai (1 - n jumlah animasi)
                if self.playerCurrentAnimCount == self.player.attackAnimationCount {
                    
                    // matikan timer
                    attackTimer!.invalidate()
                    attackTimer = nil
                    
                    // kembalikan ke idle animation
                    self.playerCurrentAnim = "idle"
                    self.togglePlayerIdleAnimation(true)
                    
                    self.toggleOpponentIdleAnimation(false)
                    self.opponentCurrentAnim = "dmg"
                    var damageTimer: Timer?// timer oponent kena damage
                    
                    damageTimer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
                        
                        // apakah animasi sudah selesai (1 - n jumlah animasi)
                        if self.opponentCurrentAnimCount == self.opponent.damageAnimationCount {
                            
                            damageTimer!.invalidate() // matikan timer
                            damageTimer = nil
                            
                            self.opponentCurrentAnim = "idle"
                            self.toggleOpponentIdleAnimation(true)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                                self.doEnemyAttack()
                            }
                            
                        }else{
                            self.opponentCurrentAnimCount += 1
                        }
                        
                    }
                    
                } else {
                    
                    // habiskan attack animasi
                    self.playerCurrentAnimCount += 1
                    
                }
            }
            
        }
        
        func doEnemyAttack() -> Void {
            
            self.toggleOpponentIdleAnimation(false) // matikan loop idle animasi
            self.opponentCurrentAnim = "atk" // ganti ke animasi attack (hanya ada idle dan atk)
            var attackTimer: Timer?// buat timer attack
            
            // set timer attack dengan interval 0.1 detik per animasi
            attackTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                
                // apakah animasi sudah selesai (1 - n jumlah animasi)
                if self.opponentCurrentAnimCount == self.opponent.attackAnimationCount {
                    
                    // matikan timer
                    attackTimer!.invalidate()
                    attackTimer = nil
                    
                    // attack musuh
                    self.character.playerHP -= self.enemy.enemyAttack
                    
                    if self.character.playerHP <= 0 {
                        self.character.playerHP = 0
                        self.playerDie()
                    } else {
                        // kembalikan ke idle animation
                        self.opponentCurrentAnim = "idle"
                        self.toggleOpponentIdleAnimation(true)
                        
                        self.togglePlayerIdleAnimation(false)
                        self.playerCurrentAnim = "dmg"
                        var damageTimer: Timer?// timer oponent kena damage
                        
                        damageTimer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
                            
                            // apakah animasi sudah selesai (1 - n jumlah animasi)
                            if self.playerCurrentAnimCount == self.player.damageAnimationCount {
                                
                                damageTimer!.invalidate() // matikan timer
                                damageTimer = nil
                                
                                self.playerCurrentAnim = "idle"
                                self.disableControl = false
                                self.togglePlayerIdleAnimation(true)
                            }else{
                                self.playerCurrentAnimCount += 1
                            }
                        }
                    }
                    
                } else {
                    
                    // habiskan attack animasi
                    self.opponentCurrentAnimCount += 1
                    
                }
            }
            
        }
        
        func playerHeal() -> Void {
            character.potion -= 1
            character.playerHP += 20
            character.playerMP += 10
        }
        
        func playerDie() -> Void {
            
            self.disableControl = true
            
            self.togglePlayerIdleAnimation(false) // matikan loop idle animasi
            self.playerCurrentAnim = "die" // ganti ke animasi attack (hanya ada idle dan atk)
            var dyingTimer: Timer?// buat timer attack
            
            // set timer attack dengan interval 0.1 detik per animasi
            dyingTimer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
                
                // apakah animasi sudah selesai (1 - n jumlah animasi)
                if self.playerCurrentAnimCount == self.player.dyingAnimationCount {
                    
                    // matikan timer
                    dyingTimer!.invalidate()
                    dyingTimer = nil
                    
                } else {
                    
                    // habiskan attack animasi
                    self.playerCurrentAnimCount += 1
                    
                }
            }
            
        }
        
        
    }
}






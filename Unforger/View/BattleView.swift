//
//  BattleView.swift
//  Unforger
//
//  Created by MacBook Pro on 02/06/23.
//
import SwiftUI

struct BattleView: View {
    
    @StateObject var playerViewModel: PlayerViewModel
    @ObservedObject var vm: ViewModel
    @State private var alertItem: AlertItem?
    
    
    let musicPlayer = MusicPlayer()
    var body: some View {
        VStack {
            
            VStack {
                Spacer().onAppear { vm.initAnimation() }
                
                HStack {
                    Image("\(vm.player.type.lowercased())_\(vm.playerCurrentAnim)_\(vm.playerCurrentAnimCount)")
                        .resizable()
                        .frame(width: 90, height: 50)
                    Spacer()
                    Image("\(vm.opponent.type.lowercased())_\(vm.opponentCurrentAnim)_\(vm.opponentCurrentAnimCount)")
                        .resizable()
                        .frame(width: 90, height: 50)
                        .scaleEffect(x: -1, y: 1)
                }
                .padding(.bottom, -10)
                
                Image("terrain")
                    .resizable()
                    .frame(height: 50)
            }
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            .background(.blue)
            
            // Banner at the top
            // Centered Content
            VStack {
                Spacer()
                // Dialog Box
                VStack {
                    // Player 1 information
                    HStack {
                        Image("assasin_atk_1")
                            .resizable()
                            .frame(width: 100, height: 50)
                        
                        VStack(alignment: .leading) {
                            Text("\(playerViewModel.player.nickname)")
                                .font(.title)
                                .foregroundColor(.blue)
                            Text("Health: \(vm.character.playerHP)")
                                .foregroundColor(.green)
                            Text("Mana: \(vm.character.playerMP)")
                                .foregroundColor(.orange)
                        }
                        
                        Spacer()
                    }
                    
                    Divider() // Optional divider line
                    
                    // Player 2 information
                    HStack {
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Text("\(vm.enemy.enemyName)")
                                .font(.title)
                                .foregroundColor(.red)
                            Text("Health: \(vm.enemy.enemyHP)")
                                .foregroundColor(.green)
                        }
                        
                        Image("assasin_atk_1")
                            .resizable()
                            .frame(width: 100, height: 50)
                    }
                    
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .frame(width: 300, height: 120)
                    
                    Spacer()
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .frame(width: 300, height: 120)
                .fixedSize() // Fit the frame to the content
                Spacer()
                
                
                //buttons
                VStack(spacing: 10) {
                    if vm.disableControl {
                        Text("Enemy's Turn")
                    } else {
//                        if vm.character.playerHP <= 0 {
//                            alertItem = AlertContext.playerLose
//                        } else if vm.enemy.enemyHP <= 0 {
//                            alertItem = AlertContext.playerWin
//                        } else {
                            ForEach(vm.player.skills, id: \.self) { skill in
                                Button(action: {
                                    vm.doPlayerAttack(skill: skill)
                                    
                                    if vm.player.skills[0].skillName == skill.skillName {
                                        vm.skill1()
                                    } else if vm.player.skills[1].skillName == skill.skillName {
                                        vm.skill2()
                                    } else {
                                        vm.skill3()
                                    }
                                    
                                }) {
                                    Text(skill.skillName)
                                        .foregroundColor(.black)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.customBackground)
                                        .cornerRadius(10)
                                        .bold()
                                }
                            }
                            Button(action: {
                                
                                if vm.character.potion > 0 {
                                    if vm.character.playerHP >= 100 || vm.character.playerMP >= 50 {
                                        alertItem = AlertContext.fullHP
                                        return
                                    } else {
                                        vm.playerHeal()
                                        if vm.character.playerHP > 100 {
                                            vm.character.playerHP = 100
                                        }
                                    }
                                    
                                } else {
                                    alertItem = AlertContext.noPotion
                                    return
                                }
                                
                            }) {
                                Text("Heal")
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(.green)
                                    .cornerRadius(10)
                                    .bold()
                            }
                        }
                    }
                }

            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding()
            .alert(item: $alertItem, content: { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action: {}))
            })
        }
    }
    //        .onAppear {
    //            musicPlayer.play()
    //        }
    //        .onDisappear {
    //            musicPlayer.stop()
    //        }
    //        Spacer()
}




//struct BattleView_Previews: PreviewProvider {
//    static var previews: some View {
//        BattleView(vm: )
//    }
//}

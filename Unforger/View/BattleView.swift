//
//  BattleView.swift
//  Unforger
//
//  Created by MacBook Pro on 02/06/23.
//
import SwiftUI

struct BattleView: View {
    
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
                // Dialog Box
                VStack(alignment: .leading) {
                    HStack(alignment: .top){
                        Image("assassin_model")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 180, height: 100)
                            .padding()
                            .background(Color.white)
                        
                        Text("Health : \(vm.enemy.enemyHP)\nMana : \(vm.character.playerMP)\nPotion : \(vm.character.potion)")
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .alignmentGuide(.leading) { _ in -100 }
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    Spacer()
                }
                .fixedSize() // Fit the frame to the content
                Spacer()
                
                
                //buttons
                VStack(spacing: 10) {
                    if vm.disableControl{
                        Text("Enemy's Turn")
                    } else {
                        
                        ForEach(vm.player.skills, id: \.self) { skill in
                            Button(action: {
                                vm.doPlayerAttack(skill: skill)
                            }) {
                                Text(skill.skillname)
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
                                if vm.character.playerHP >= 100 {
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
        .onAppear {
            musicPlayer.play()
        }
        .onDisappear {
            musicPlayer.stop()
        }
        Spacer()
        
    }
}



//struct BattleView_Previews: PreviewProvider {
//    static var previews: some View {
//        BattleView(vm: )
//    }
//}

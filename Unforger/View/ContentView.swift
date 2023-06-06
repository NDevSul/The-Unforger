//
//  ContentView.swift
//  Unforger
//
//  Created by MacBook Pro on 03/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var playerViewModel: PlayerViewModel
    @ObservedObject var vm: BattleView.ViewModel
    @State var show = false
    @State var print = false
    @State var blok = false
    @State var profile = false
    
    var body: some View {
        ZStack{
            ScrollView{
                HStack{
                    Image(systemName: "line.3.horizontal.decrease")
                    Spacer()
                    Text("Welcome")
                        .font(.headline)
                    Spacer()
                    Button(action: {
                        profile = true
                    }) {
                        Image(systemName: "person.crop.circle")
                    }
                    .padding(.trailing, 8)
                    .background(
//                        NavigationLink(destination: ProfileView(), isActive: $profile) {
//                            EmptyView()
//                        }
                    )
                    .buttonStyle(PlainButtonStyle())
                    
                    
                }
                .padding()
                
                BannerHome()
                    .frame(height: 200)
                    .padding(.horizontal, 24)
                
                Text("Dungeon")
                    .font(.title2).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(24)
                
                HStack{
                    Button(action: {
                        show.toggle()
                    }) {
                        BannerCastle(title: "Village", y: 100)
                            .frame(width: 160, height: 300)
                            .offset(x: -10, y: 10)
                    }
                    
                    
                    VStack{
                        Button(action: {
                            print.toggle()
                        }) {
                            BannnerWolf(title: "Ware Wolf", y: 100)
                                .frame(width: 160, height: 140)
                                .offset(x: 0, y: 0)
                            
                        }
                        Button(action: {
                            blok.toggle()
                        }) {
                            BannerDying(title: "Dying", y: 150)
                                .frame(width: 160, height: 130)
                                .offset(x: 0, y: 15)
                            
                        }
                    }
                }
                
            }
            .sheet(isPresented: $profile) {
//                ProfileView()
            }
            .sheet(isPresented: $show) {
                BottomSheetCastle(playerViewModel: playerViewModel, vm: vm, show: $show)
            }
            
            .sheet(isPresented: $print) {
                BottomSheetWolf(playerViewModel: playerViewModel, vm: vm, show: $print)
            }
            .sheet(isPresented: $blok) {
                BottomSheetDying(playerViewModel: playerViewModel, vm: vm, show: $blok)
            }
        }
        
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

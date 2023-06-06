//
//  WolfView.swift
//  Unforger
//
//  Created by MacBook Pro on 04/06/23.
//

import SwiftUI

struct WolfView: View {
    @StateObject var playerViewModel: PlayerViewModel
    @ObservedObject var vm: BattleView.ViewModel

    @State var show = false
    var body: some View {
        ZStack{
            ScrollView{
                SheetCardWolf()
                    .frame(height: 480)
                    .padding(.horizontal, 24)
                    .padding()
                Text("Apakah kamu yakin ingin memasuki dungeon ini?")
                    .font(.subheadline)
                
                Text("Di area ini banyak musuh berupa serigala, jadi kamu harus berhati-hati ketika memasukinya")
                    .font(.caption)
                    .padding(20)
                VStack{
                    HStack{
                        Button(action: {
                            show.toggle()
                        }) {
                            Text("Start")
                                .frame(width: 150, height: 10)
                                .foregroundColor(.white)
                                .padding()
                                .background(
                                   Image("werewolf")
                                    .resizable()
                                    .clipped()
                                    .padding(-10)
                                    .frame(width: 200, height: 50)
                                    .cornerRadius(30)
                                )
                            
                        }
                    }
                }
                .sheet(isPresented: $show) {
                    BattleView(playerViewModel: playerViewModel, vm: vm)
                }
            }
        }
    }
}

//struct WolfView_Previews: PreviewProvider {
//    static var previews: some View {
//        WolfView()
//    }
//}

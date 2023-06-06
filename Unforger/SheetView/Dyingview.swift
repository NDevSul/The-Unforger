//
//  Dyingview.swift
//  Unforger
//
//  Created by MacBook Pro on 04/06/23.
//

import SwiftUI

struct Dyingview: View {
    @StateObject var playerViewModel: PlayerViewModel
    @ObservedObject var vm: BattleView.ViewModel
    @State var show = false
    var body: some View {
        ZStack{
                ScrollView{
                    SheetCardDyig(y: 100)
                        .frame(height: 480)
                        .padding(.horizontal, 24)
                        .padding()
                    Text("Apakah kamu yakin ingin memasuki dungeon ini?")
                        .font(.subheadline)
                    
                    Text("Di area ini banyak musuh berupa manusia yang sekarat (ZOMBIE!), jadi kamu harus berhati-hati ketika memasukinya")
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
                                    Image("dungeo3")
                                        .resizable()
                                        .clipped()
                                        
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

//struct Dyingview_Previews: PreviewProvider {
//    static var previews: some View {
//        Dyingview()
//    }
//}

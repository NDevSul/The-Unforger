//
//  CastleView.swift
//  Unforger
//
//  Created by MacBook Pro on 04/06/23.
//

import SwiftUI

struct CastleView: View {
    @ObservedObject var vm: BattleView.ViewModel
    @State var show = false
    @State private var navigateToBattleView = false // State variable to control navigation

    var body: some View {
//        NavigationLink(
//            destination: BattleView(vm: vm), isActive: $navigateToBattleView) { // Use NavigationLink to navigate to BattleView
//                    EmptyView()
//                }
//                .hidden()
        ZStack{
            ScrollView{
                SheetCardCastle()
                    .frame(height: 480)
                    .padding(.horizontal, 24)
                    .padding()
                Text("A sight has been seen in the village")
                    .font(.subheadline)
                
                Text("You spotted a villager in front of you, the villager doesn't look very friendly, he's wielding a sword. WATCH OUT!!")
                    .font(.caption)
                    .padding(20)
                VStack{
                    HStack{
                        Button(action: {
                            show.toggle()
                            navigateToBattleView = true
                        }) {
                            Text("Start")
                                .frame(width: 150, height: 10)
                                .foregroundColor(.white)
                                .padding()
                                .background(
                                   Image("Village")
                                    .resizable()
                                    .clipped()
                                    .padding(-10)
                                    .frame(width: 200, height: 50)
                                    .cornerRadius(30)
                                )
                            
                        }
                    }
                }
                
            }
        }
    }
}

//struct CastleView_Previews: PreviewProvider {
//    static var previews: some View {
//        CastleView()
//    }
//}

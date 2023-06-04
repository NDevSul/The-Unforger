//
//  ContentView.swift
//  Unforger
//
//  Created by MacBook Pro on 03/06/23.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var asu = false
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
                        NavigationLink(destination: Profile(), isActive: $profile) {
                            EmptyView()
                        }
                    )
                    .buttonStyle(PlainButtonStyle())
                    
                    
                }
                .padding()
                
                CardView()
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
                        CardDungen1(title: "Dead Castle", y: 100)
                            .frame(width: 160, height: 300)
                            .offset(x: -10, y: 10)
                    }
                    
                    
                    VStack{
                        Button(action: {
                            asu.toggle()
                        }) {
                            CardDungeon2(title: "Ware Wolf", y: 100)
                                .frame(width: 160, height: 140)
                                .offset(x: 0, y: 0)
                            
                        }
                        Button(action: {
                            blok.toggle()
                        }) {
                            CardDungeon3(title: "Dying", y: 150)
                                .frame(width: 160, height: 130)
                                .offset(x: 0, y: 15)
                            
                        }
                    }
                }
                
            }
            .sheet(isPresented: $profile) {
                Profile()
            }
            .sheet(isPresented: $show) {
                BottomSheet(show: $show)
            }
            
            .sheet(isPresented: $asu) {
                Sheet1(show: $asu)
            }
            .sheet(isPresented: $blok) {
                Sheet2(show: $blok)
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  BottomSheetCastle.swift
//  Unforger
//
//  Created by MacBook Pro on 04/06/23.
//

import SwiftUI

struct BottomSheetCastle: View {
    @StateObject var playerViewModel: PlayerViewModel
    @ObservedObject var vm: BattleView.ViewModel
    @State var translation: CGSize = .zero
    @State var offsetY: CGFloat = 0
    @Binding var show: Bool
    
    var body: some View{
        ZStack{
            content
            Button{
                withAnimation(.easeOut){
                    show.toggle()
                }
            }label: {
                Image(systemName: "xmark")
                    .font(.body.bold())
                    .foregroundColor(.white)
                    .padding(9)
                    .background(Color(UIColor(.accentColor)))
                    .mask(Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding()
            .opacity(show ? 1 : 0)
        }
    }
    
    var content: some View {

        GeometryReader { proxy in
            VStack{
                CastleView(playerViewModel: playerViewModel, vm: vm)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .offset(y: translation.height + offsetY)
            .gesture(
                DragGesture()
                    .onChanged{ value in
                        translation = value.translation
                    }
                    .onEnded{ value in
                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.7)){
                            let snap = translation.height + offsetY
                            let quarter = proxy.size.height / 4
                            
                            if snap > quarter && snap < quarter*3 {
                                offsetY = quarter*2
                            }else if snap > quarter*3 && snap < quarter*4{
                                offsetY = quarter*3 + 100
                            }else if snap > quarter*4{
                                show.toggle()
                            }else{
                                offsetY = 0
                            }
                            
                            translation = .zero
                        }
                    }
                
            )
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

//struct BottomSheetCastle_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomSheetCastle(show: .constant(true))
//            .background(.blue)
//    }
//}

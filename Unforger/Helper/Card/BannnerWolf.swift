//
//  BannnerWolf.swift
//  Unforger
//
//  Created by MacBook Pro on 04/06/23.
//

import SwiftUI

struct BannnerWolf: View {
    var title = ""
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    var body: some View {
        VStack{
            Text(title).font(.title).bold()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(30)
        }
        .foregroundColor(.white)
        .frame(width:160, height: 140)
        .background(Image("dungeon2").scaleEffect(0.3).offset(x: x, y: y))
        .background(Color(UIColor(.accentColor)))
        .cornerRadius(10)
        .mask(RoundedCorner2(radius: 30, corners: [.topLeft, .bottomRight]))
    }
}
struct RoundedCorner2: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )

        return Path(path.cgPath)
    }
}

struct BannnerWolf_Previews: PreviewProvider {
    static var previews: some View {
        BannnerWolf()
    }
}

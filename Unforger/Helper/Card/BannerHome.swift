//
//  BannerHome.swift
//  Unforger
//
//  Created by MacBook Pro on 04/06/23.
//

import SwiftUI

struct BannerHome: View {
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
        .frame(maxWidth: .infinity)
        .background(Image("banner2").scaleEffect(1).offset(x: x, y: y))
        .background(Color(UIColor(.accentColor)))
        .cornerRadius(10)
        .mask(RoundedCorner(radius: 30, corners: [.topLeft, .bottomRight]))
    }
}
struct RoundedCorner: Shape {
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

struct BannerHome_Previews: PreviewProvider {
    static var previews: some View {
        BannerHome()
    }
}

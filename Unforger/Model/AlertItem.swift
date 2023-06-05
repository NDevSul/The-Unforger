//
//  AlertItem.swift
//  Unforger
//
//  Created by MacBook Pro on 05/06/23.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    static let fullHP    = AlertItem(title: Text("Full HP!"),
                                       message: Text("Your health is still full"),
                                       buttonTitle: Text("Ok"))
    
    static let noPotion    = AlertItem(title: Text("0 Potion!"),
                                          message: Text("You just ran out of potion"),
                                          buttonTitle: Text("Ok"))
    
}

//
//  AlertItem.swift
//  MacUnforger
//
//  Created by MacBook Pro on 06/06/23.
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
                                       message: Text("Your health / mana is still full"),
                                       buttonTitle: Text("Ok"))
    
    static let noPotion    = AlertItem(title: Text("0 Potion!"),
                                          message: Text("You just ran out of potion"),
                                          buttonTitle: Text("Ok"))
    
    static let playerWin    = AlertItem(title: Text("You Won!"),
                                          message: Text("You just saved the entire village"),
                                          buttonTitle: Text("Heck Yeah!"))
    
    static let playerLose    = AlertItem(title: Text("You Lost!"),
                                          message: Text("Your powers are not enough to defeat the villager"),
                                          buttonTitle: Text("Ok"))
    
}

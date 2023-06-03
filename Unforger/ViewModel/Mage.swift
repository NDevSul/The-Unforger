//
//  Mage.swift
//  Unforger
//
//  Created by MacBook Pro on 04/06/23.
//

import Foundation

struct Mage: Classable {
    var idleAnimationCount: Int = 7
    var attackAnimationCount: Int = 4
    
    var type: String = "Mage"
    
    var skills: [Skills] = [
        Skills(skillname: "Booty shaker", skilldamage: 100, skillmana: 1)
    ]
}
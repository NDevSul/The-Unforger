//
//  Mage.swift
//  Unforger
//
//  Created by MacBook Pro on 04/06/23.
//

import Foundation

struct Mage: Classable {
    
    var damageAnimationCount: Int = 3
    var idleAnimationCount: Int = 7
    var attackAnimationCount: Int = 4
    var dyingAnimationCount: Int = 6
    var type: String = "Mage"
    
    var skills: [Skills] = [
        Skills(skillname: "Basic Attack", skilldamage: 10, skillmana: 0),
        Skills(skillname: "Splash", skilldamage: 20, skillmana: 5),
        Skills(skillname: "Clone Summoning", skilldamage: 50, skillmana: 50)
    ]
}

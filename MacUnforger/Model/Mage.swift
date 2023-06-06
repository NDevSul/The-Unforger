//
//  Mage.swift
//  MacUnforger
//
//  Created by MacBook Pro on 06/06/23.
//

import Foundation
struct Mage: Classable {
    
    var damageAnimationCount: Int = 3
    var idleAnimationCount: Int = 7
    var attackAnimationCount: Int = 4
    var dyingAnimationCount: Int = 6
    var type: String = "Mage"
    
    var skills: [Skills] = [
        Skills(skillName: "Basic Attack", skillDamage: 10, skillMana: 0),
        Skills(skillName: "Splash", skillDamage: 20, skillMana: 5),
        Skills(skillName: "Clone Summoning", skillDamage: 50, skillMana: 50)
    ]
}

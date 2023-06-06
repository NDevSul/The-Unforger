//
//  Fighter.swift
//  MacUnforger
//
//  Created by MacBook Pro on 06/06/23.
//

import Foundation
struct Fighter: Classable {
    
    var damageAnimationCount: Int = 3
    var idleAnimationCount: Int = 7
    var attackAnimationCount: Int = 4
    var dyingAnimationCount: Int = 6
    var type: String = "Fighter"
    
    var skills: [Skills] = [
        Skills(skillName: "Basic Attack", skillDamage: 10, skillMana: 0),
        Skills(skillName: "Slash", skillDamage: 20, skillMana: 5),
        Skills(skillName: "Jaw Breaker", skillDamage: 50, skillMana: 50)
    ]
}

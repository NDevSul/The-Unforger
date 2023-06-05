//
//  Enemies.swift
//  Unforger
//
//  Created by MacBook Pro on 05/06/23.
//

import Foundation

struct Enemy: Classable {
    
    var damageAnimationCount: Int = 3
    var idleAnimationCount: Int = 7
    var attackAnimationCount: Int = 4
    var dyingAnimationCount: Int = 6
    var type: String = "Enemy"
    
    var skills: [Skills] = [
        Skills(skillName: "Basic Attack", skillDamage: 10, skillMana: 0),
    ]
}

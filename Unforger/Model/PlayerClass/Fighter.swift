//
//  Fighter.swift
//  Unforger
//
//  Created by MacBook Pro on 04/06/23.
//

import Foundation

struct Fighter: Classable {
    
    var damageAnimationCount: Int = 3
    var idleAnimationCount: Int = 7
    var attackAnimationCount: Int = 4
    var dyingAnimationCount: Int = 6
    var type: String = "Fighter"
    
    var skills: [Skills] = [
        Skills(skillname: "Basic Attack", skilldamage: 10, skillmana: 0),
        Skills(skillname: "Slash", skilldamage: 20, skillmana: 5),
        Skills(skillname: "Jaw Breaker", skilldamage: 50, skillmana: 50)
    ]
}

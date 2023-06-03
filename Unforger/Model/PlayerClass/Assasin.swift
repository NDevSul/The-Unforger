//
//  Assasin.swift
//  Unforger
//
//  Created by Rama Adi Nugraha on 04/06/23.
//

import Foundation

struct Assasin: Classable {
    var idleAnimationCount: Int = 7
    var attackAnimationCount: Int = 4
    
    var type: String = "Assasin"
    
    var skills: [Skills] = [
        Skills(skillname: "Booty shaker", skilldamage: 100, skillmana: 1)
    ]
}

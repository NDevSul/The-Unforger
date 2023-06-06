//
//  Job.swift
//  MacUnforger
//
//  Created by MacBook Pro on 06/06/23.
//

import Foundation

protocol Classable {
    var type: String { get }
    var skills: [Skills] {  get }
    var idleAnimationCount: Int { get }
    var attackAnimationCount: Int { get }
    var damageAnimationCount: Int { get }
    var dyingAnimationCount: Int { get }
}

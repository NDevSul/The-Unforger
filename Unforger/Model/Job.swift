//
//  Job.swift
//  Unforger
//
//  Created by Rama Adi Nugraha on 04/06/23.
//

import Foundation

protocol Classable {
    var type: String { get }
    var skills: [Skills] {  get }
    var idleAnimationCount: Int { get }
    var attackAnimationCount: Int { get }
}

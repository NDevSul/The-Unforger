//
//  Player.swift
//  Unforger
//
//  Created by MacBook Pro on 03/06/23.
//

import Foundation

struct Player {
    var playerName: String
    var role: String
    var playerHP: Int
    var playerMP: Int
    var potion : Int
    var elixir : Int
    
    init(playerName: String, role: String, playerHP: Int, playerMP: Int, potion: Int, elixir: Int) {
        self.playerName = playerName
        self.role = role
        self.playerHP = playerHP
        self.playerMP = playerMP
        self.potion = potion
        self.elixir = elixir
    }
    
}

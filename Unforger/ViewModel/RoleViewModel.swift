//
//  RoleViewModel.swift
//  Unforger
//
//  Created by MacBook Pro on 04/06/23.
//

import SwiftUI

class PlayerViewModel: ObservableObject {
    @Published var player: Player

    init(player: Player) {
        self.player = player
    }
}

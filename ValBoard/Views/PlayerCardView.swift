//
//  PlayerCardView.swift
//  ValBoard
//
//  Created by Asir Alam on 8/25/24.
//

import SwiftUI

struct PlayerCardView: View {
    let playerData: PlayerData
    
    var body: some View {
        Text("Hello, World! \(playerData)")
    }
}

#Preview {
    PlayerCardView(playerData: PlayerData(puuid: "abc", region: "na"))
}

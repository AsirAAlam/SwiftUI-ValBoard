//
//  PlayerCardView.swift
//  ValBoard
//
//  Created by Asir Alam on 8/25/24.
//

import SwiftUI

struct PlayerCardView: View {
    @StateObject var viewModel = PlayerCardViewViewModel()
    let playerData: PlayerData
    
    var body: some View {
        VStack {
            if let data = viewModel.dataMMR {
                Text(data.current.tier.name + " " + String(data.current.rr))
            } else {
                Text("Fetching data...")
            }
        }
        .onAppear {
            viewModel.fetchPlayerData(playerData: playerData)
        }
        
    }
}

#Preview {
    PlayerCardView(playerData: PlayerData(puuid: "abc", region: "na"))
}

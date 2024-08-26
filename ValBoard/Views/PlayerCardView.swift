//
//  PlayerCardView.swift
//  ValBoard
//
//  Created by Asir Alam on 8/25/24.
//

import SwiftUI

struct PlayerCardView: View {
    let playerData: PlayerData
    @StateObject var viewModel = PlayerCardViewViewModel()
    
    var body: some View {
        VStack {
            if let data = viewModel.dataMMR {
                Text(data.current.tier.name + " " + String(data.current.rr))
                
                if let url = RankTierToIcon[data.current.tier.name] {
                    AsyncImage(url: URL(string: url))
                } else {
                    Text("Could not find rank icon")
                }
                
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
    PlayerCardView(playerData: PlayerData(puuid: "25252432-1d8f-5299-b6ee-e918cbd05ff5", region: "na"))
}

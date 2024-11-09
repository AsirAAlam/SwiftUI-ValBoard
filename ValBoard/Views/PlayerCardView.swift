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
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            if let data = viewModel.mmrData {
                
                if let name = playerData.name {
                    if let tag = playerData.tag {
                        HStack(spacing: 0) {
                            Text(name).bold().font(.system(size: 32))
                            Text("#" + tag).padding(3).background(colorScheme == .dark ? Color(red: 0.3, green: 0.3, blue: 0.3) : Color(red: 0.8, green: 0.8, blue: 0.8)).font(.system(size: 16))
                        }
                    }
                }
                
                if let url = RankTierToIcon[data.current.tier.name] {
                    AsyncImage(url: URL(string: url))
                } else {
                    Text("Could not find rank icon")
                }
                
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
    PlayerCardView(playerData: PlayerData(puuid: "25252432-1d8f-5299-b6ee-e918cbd05ff5", region: "na", name: "A5IR", tag: "001", card: nil))
}

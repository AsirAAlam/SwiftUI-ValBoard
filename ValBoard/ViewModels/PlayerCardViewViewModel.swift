//
//  PlayerCardViewViewModel.swift
//  ValBoard
//
//  Created by Asir Alam on 8/25/24.
//

import Foundation

struct DataMMRTier: Codable {
    let id: Int
    let name: String
}

struct DataMMRCurrent: Codable {
    let tier: DataMMRTier
    let rr: Int
    let last_change: Int
    let elo: Int
}

struct DataMMR: Codable {
    let current: DataMMRCurrent
}

struct ResponseMMR: Codable {
    let status: Int
    let data: DataMMR
}

class PlayerCardViewViewModel: ObservableObject {
    
    @Published var dataMMR: DataMMR?
    @Published var errorMsg: String = ""
    
    init() {}
    
    func fetchPlayerData(playerData: PlayerData) {
        
        var request = URLRequest(url: URL(string: "https://api.henrikdev.xyz/valorant/v3/by-puuid/mmr/\(playerData.region)/pc/\(playerData.puuid)")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("", forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data else {
                print(String(describing: error))
                DispatchQueue.main.async {
                    self?.errorMsg = "Error fetching data"
                }
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(ResponseMMR.self, from: data)

                DispatchQueue.main.async {
                    self?.dataMMR = decoded.data
                }
            }
            catch {
                DispatchQueue.main.async {
                    self?.errorMsg = "Error fetching data"
                }
                
                print(error)
            }
        }

        task.resume()
    }
}

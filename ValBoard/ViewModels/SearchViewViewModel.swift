//
//  SearchViewViewModel.swift
//  ValBoard
//
//  Created by Asir Alam on 8/25/24.
//

import Foundation

struct Card: Codable {
    let small: String
    let large: String
    let wide: String
    let id: String
}

struct PlayerData: Codable {
    let puuid: String
    let region: String
}

struct Response: Codable {
    let status: Int
    let data: PlayerData
}

class SearchViewViewModel: ObservableObject {
    
    @Published var accountId: String = ""
    @Published var playerData: PlayerData?
    @Published var errorMsg: String = ""
    @Published var showingPlayerCard: Bool = false
    
    init() {}
    
    func search() {
        errorMsg = ""
        
        guard accountId.contains("#") else {
            errorMsg = "Please enter an account in the form: Name#Tag"
            return
        }
        
        let splits = accountId.split(separator: "#")
        let name = splits[0]
        let tag = splits[1]
        
        var request = URLRequest(url: URL(string: "https://api.henrikdev.xyz/valorant/v1/account/\(name)/\(tag)")!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("", forHTTPHeaderField: "Authorization")

        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(Response.self, from: data)

                DispatchQueue.main.async {
                    self?.playerData = decoded.data
                    self?.showingPlayerCard = true
                }
            }
            catch {
                self?.errorMsg = "Error fetching account"
                print(error)
            }
        }

        task.resume()
    }
}

//
//  SearchView.swift
//  ValBoard
//
//  Created by Asir Alam on 8/25/24.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewViewModel()
    
    var body: some View {
        
        VStack {
            Form {
                if !viewModel.errorMsg.isEmpty {
                    Text(viewModel.errorMsg)
                        .foregroundColor(Color.red)
                }
                
                TextField("Name#Tag", text: $viewModel.accountId)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                ValButton(
                    title: "Search",
                    background: Color.blue
                ) {
                    viewModel.search()
                }
            }
        }
        .sheet(isPresented: $viewModel.showingPlayerCard, content: {
            if let playerData: PlayerData = viewModel.playerData {
                PlayerCardView(playerData: playerData)
            } else {
                Text("Player not found")
            }
        })
    }
    
    
}

#Preview {
    SearchView()
}

//
//  MainMenuView.swift
//  mobile-project
//
//  Created by Bruno on 2024-02-25.
//

import SwiftUI

struct MainMenuView: View {
    
    @State private var username: String = ""
    
    var body: some View {
        VStack {
            Text("Main Menu")
            
            NavigationLink(
                destination: {
                    LeaderboardView()
                }, label: {
                    Text("Leaderboard")
                }
            )
    
            TextField(
                "username",
                text: $username
            )
            .disableAutocorrection(true)
            .border(.secondary)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
    
            NavigationLink(
                destination: {
                    GameView(username: username)
                }, label: {
                    Text("Game Start!")
                }            
            )
        }
        .frame(width: 300.0)
    }
}

#Preview {
    MainMenuView()
}

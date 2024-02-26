//
//  LeaderboardView.swift
//  mobile-project
//
//  Created by Bruno on 2024-02-25.
//

import SwiftUI

struct LeadReg: Identifiable {
    var id = UUID()
    var username: String
    var points: Int
}

struct LeaderboardView: View {
    var data: [LeadReg] = [
        LeadReg(username: "JohnDoe", points: 950),
        LeadReg(username: "AliceSmith", points: 800),
        LeadReg(username: "BobJhonson", points: 720),
        LeadReg(username: "EmilyBrown", points: 500)
    ]
    
    var body: some View {
        NavigationStack {
            Text("Leaderboard")
            
            VStack {
                ForEach(data) { info in
                    HStack {
                        Text("\(info.username)")
                            .multilineTextAlignment(.leading)
                            .padding(0.0)
                            .frame(width: 150.0)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        Text("\(info.points)")
                            .multilineTextAlignment(.center)
                            .padding(0.0)
                            .frame(width: 80.0)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    }
                    .padding(0.0)
                }
            }
        }
    }
}

#Preview {
    LeaderboardView()
}

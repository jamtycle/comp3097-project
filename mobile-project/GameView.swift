//
//  GameView.swift
//  mobile-project
//
//  Created by Bruno on 2024-02-25.
//

import SwiftUI

struct GameView: View {
    var username: String
    @Environment(\.presentationMode) var presentationMode
    let word = "swift".uppercased()
    let tries = 1...5
    	
    var body: some View {
        NavigationStack {
            VStack {
                Text("Game!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
                    .multilineTextAlignment(.center)
                    .frame(height: 100.0)
                                
                let letters = Array(word)
                
                VStack {
                    ForEach(tries, id: \.self) { try_i in
                        WordRow(try_index: try_i, word: letters)
                    }
                }
            }
        }
        .onAppear {
            if username.isEmpty {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct WordRow: View {
    var try_index: Int
    var word: [Character]
    @State private var inputLetters: [String] = []
    
    init(try_index: Int, word: [Character]) {
        self.try_index = try_index
        self.word = word
        self.inputLetters = word.map { _ in "" }
    }
    
    var body: some View {
        HStack {
            ForEach(word.indices, id: \.self) { index in
                LetterView(letter: word[index])
            }
        }
    }
    
}

struct LetterView: View {
    let letter: Character
    @State var input_letter: String = ""
        
    var body: some View {
        ZStack {
            TextField("", text: $input_letter)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 0.0)
                .multilineTextAlignment(.center)
                .frame(width: 55.0)
                .onChange(of: input_letter) {
                    if input_letter.count > 1 {
                        input_letter = String(input_letter.prefix(1))
                    }
                }
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.orange/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.green/*@END_MENU_TOKEN@*/)
            
        }
        .layoutDirectionBehavior(.fixed	)
        .padding(1.3)
    }
}

#Preview {
    GameView(username: "<test>")
}

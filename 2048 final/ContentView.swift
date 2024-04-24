//
//  ContentView.swift
//  2048 final
//
//  Created by Phillip Mantatsky on 4/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            NavigationView {
                VStack {
                    Text("")
                        .padding()
                    NavigationLink(destination: GameView(phrase: "Start Game")) {
                        Text("Play Game")
                            .bold()
                            .font(.title)
                    }
                }
                .navigationTitle("Menu")
            }
        }
    }

    #Preview {
        ContentView()
    }

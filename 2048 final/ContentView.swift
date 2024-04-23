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

                    // Navigation link to the game view
                    NavigationLink(destination: GameView(phrase: "This is from the first view")) {
                        Text("Play Game")
                            .bold()
                            .font(.title)
                    }
                }
                .navigationTitle("4096 The Game")
            }
        }
    }

    #Preview {
        ContentView()
    }

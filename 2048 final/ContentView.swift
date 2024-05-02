//
//  ContentView.swift
//  2048 final
//
//  Created by Phillip Mantatsky on 4/16/24.
//
// Aishah's comment

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
                .navigationBarBackButtonHidden(true)
                .padding()
                .background(Color(red: 0.98, green: 0.75, blue: 0.60))
            }
        }
    }

    #Preview {
        ContentView()
    }

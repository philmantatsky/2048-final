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
                    NavigationLink(destination: GameView(phrase: "")) {
                        Text("Play Game")
                            .bold()
                            .font(.title)
                    }
                }
                .navigationTitle("Menu")
                .navigationBarBackButtonHidden(true)
                .padding()
                
            }
        }
    }

    #Preview {
        ContentView()
    }

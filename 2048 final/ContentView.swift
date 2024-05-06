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
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.3), Color.blue.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Welcome to the Game!")
                        .font(.title)
                        .padding()
                    NavigationLink(destination: GameView(phrase: "Start Playing")) {
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
}


    #Preview {
        ContentView()
    }

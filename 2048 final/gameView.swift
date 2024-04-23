//
//  gameView.swift
//  2048 final
//
//  Created by Phillip Mantatsky on 4/17/24.
//

import SwiftUI

struct GameView: View {
    @State private var gameBoard = Array(repeating: [0, 0, 0, 0], count: 4)
    let phrase: String
    
    var body: some View {
        NavigationView {
            VStack {
                Text(phrase)
                    .font(.headline)
                    .padding()

                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 4), spacing: 15) {
                    ForEach(0..<16, id: \.self) { index in
                        let row = index / 4
                        let column = index % 4
                        CellView(number: gameBoard[row][column])
                            .aspectRatio(1, contentMode: .fit)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("4096")
            .gesture(DragGesture()
                .onEnded(handleSwipe))
            .padding()
        }
    }
}

func handleSwipe(_ gesture: DragGesture.Value) {
    
}

#Preview {
    GameView(phrase: "")
}

//
//  gameView.swift
//  2048 final
//
//  Created by Phillip Mantatsky on 4/17/24.
//

import SwiftUI

struct GameView: View {
    @State private var gameBoard = Array(repeating: [0, 0, 0, 0], count: 4)
    @State private var numbers2 = 2
    @State private var gameScore = 0
    @State private var isGameOver = false
    @State private var isGameWinner = false
    @State private var highScore = 0
    let phrase: String
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text(phrase)
                        .font(.headline)
                        .padding()
                    
                    Text("High Score: \(highScore)")
                        .font(.custom("Times New Roman", size: 40))
                        .padding()
                        .position(x: 175, y: -25)
                    Text("Game Score: \(gameScore)")
                        .font(.custom("Times New Roman", size: 40))
                        .padding()
                        .position(x: 175, y: -120)
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 4), spacing: 15) {
                        ForEach(0..<16, id: \.self) { index in
                            let row = index / 4
                            let column = index % 4
                            CellView(number: gameBoard[row][column])
                                .aspectRatio(1, contentMode: .fit)
                        }
                    }
                    .position(x: 165, y: -59)
                    .padding(.horizontal)
                    if isGameOver {
                        Text("Game Over!")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                            .padding()
                    }
                }
                .navigationTitle("4096")
                .gesture(DragGesture()
                    .onEnded(handleSwipe))
                .padding()
                .onAppear(perform: startGame)
                .alert(isPresented: $isGameOver, content: {
                    Alert(title: Text("Game Over!"), message: Text("You scored \(gameScore) points."), dismissButton: .default(Text("Restart"), action: {
                        startGame()
                    }))
                })
                .alert(isPresented: $isGameWinner, content: {
                    Alert(title: Text("Congratulations! You Win!"), message: Text("You scored \(gameScore) points."), dismissButton: .default(Text("Restart"), action: {
                        startGame()
                    }))
                })
            }
        }
    }
    
    private func gameOver() -> Bool {
        for i in 0..<4 {
            for j in 0..<4 {
                if gameBoard[i][j] == 0 {
                    return false
                }
                if j < 3 && gameBoard[i][j] == gameBoard[i][j + 1] {
                    return false
                }
                if i < 3 && gameBoard[i][j] == gameBoard[i + 1][j] {
                    return false
                }
            }
        }
        return true
    }
    
    private func gameWinner() -> Bool {
        for i in 0..<4 {
            for j in 0..<4 {
                if gameBoard[i][j] == 4092 {
                    return true
                }
            }
        }
        return false
    }
            
    func startGame() {
        gameBoard = Array(repeating: [0, 0, 0, 0], count: 4)
        gameScore = 0
        isGameOver = false
        isGameWinner = false
        insertNumber()
        insertNumber()
    }
    
    func insertNumber() {
        var emptySpots = [(Int, Int)]()
        for (i, row) in gameBoard.enumerated() {
            for (j, value) in row.enumerated() {
                if value == 0 {
                    emptySpots.append((i, j))
                }
            }
        }
        
        if !emptySpots.isEmpty {
            let randomSpot = emptySpots[Int.random(in: 0..<emptySpots.count)]
            let randomNumber = Int.random(in: 1...10) <= 9 ? 2 : 4
            gameBoard[randomSpot.0][randomSpot.1] = randomNumber
        }
    }
    
    func handleSwipe(_ gesture: DragGesture.Value) {
            let horizontalAmount = gesture.translation.width
            let verticalAmount = gesture.translation.height
            if abs(horizontalAmount) > abs(verticalAmount) {
                if horizontalAmount < 0 {
                    swipeLeft()
                } else {
                    swipeRight()
                }
            } else {
                if verticalAmount < 0 {
                    swipeUp()
                } else {
                    swipeDown()
                }
            }
        if gameOver() {
                   self.isGameOver = true
               }
        if gameWinner() {
            self.isGameWinner = true
        }
           }

        private func swipeLeft() {
            var boardChanged = false
            gameBoard = gameBoard.map { row in
                var newRow = row.filter { $0 != 0 }
                newRow = merge(row: newRow)
                newRow.append(contentsOf: Array(repeating: 0, count: 4 - newRow.count))
                if newRow != row {
                    boardChanged = true
                }
                return newRow
            }
            if boardChanged {
                insertNumber()
            }
        }

    private func swipeRight() {
        var boardChanged = false
        gameBoard = gameBoard.map { row in
            var newRow = Array(row.filter { $0 != 0 }.reversed())
            newRow = merge(row: Array(newRow.reversed()))
            newRow = Array(repeating: 0, count: 4 - newRow.count) + newRow
            if newRow != row {
                boardChanged = true
            }
            return newRow
        }
        if boardChanged {
            insertNumber()
        }
    }

        private func swipeUp() {
            gameBoard = transpose(matrix: gameBoard)
            swipeLeft()
            gameBoard = transpose(matrix: gameBoard)
        }

        private func swipeDown() {
            gameBoard = transpose(matrix: gameBoard)
            swipeRight()
            gameBoard = transpose(matrix: gameBoard)
        }

        private func merge(row: [Int]) -> [Int] {
            var result = [Int]()
            var index = 0
            while index < row.count {
                if index + 1 < row.count && row[index] == row[index + 1] {
                    let mergedValue = row[index] * 2
                    result.append(mergedValue)
                    gameScore += mergedValue
                    index += 2
                } else {
                    result.append(row[index])
                    index += 1
                }
                if gameScore > highScore {
                    highScore = gameScore
                }
            }
            return result
        }

        private func transpose(matrix: [[Int]]) -> [[Int]] {
            var newMatrix = Array(repeating: Array(repeating: 0, count: matrix.count), count: matrix[0].count)
            for (i, row) in matrix.enumerated() {
                for (j, element) in row.enumerated() {
                    newMatrix[j][i] = element
                }
            }
            return newMatrix
        }
}
    

#Preview {
    GameView(phrase: "")
}

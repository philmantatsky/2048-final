//
//  File.swift
//  2048 final
//
//  Created by Phillip Mantatsky on 4/24/24.
//

import Foundation
class GameViewModel: ObservableObject {
    @Published var gameBoard = Array(repeating: [0, 0, 0, 0], count: 4)

    func addRandomNumber() {
    }
}

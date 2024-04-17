//
//  gameView.swift
//  2048 final
//
//  Created by Phillip Mantatsky on 4/17/24.
//

import SwiftUI

struct GameView: View {
    let phrase: String

    var body: some View {
        Text(phrase)
            .navigationTitle("Game View")
    }
}

#Preview {
    GameView(phrase: "")
}

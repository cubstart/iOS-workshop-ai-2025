//
//  WinnerView.swift
//  Hog
//
//  Created by Justin Wong on 6/18/25.
//

import SwiftUI

struct WinnerView: View {
    @Environment(GameManager.self) var gameManager
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Player \(gameManager.winner!.rawValue) Won! 🎉")
                .bold()
                .font(.title)
            Button(action: {
                gameManager.resetGame()
            }) {
                Text("Reset Game")
                    .fontWeight(.semibold)
                    .font(.title2)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(.regularMaterial)
    }
}

#Preview {
    let gameManager = GameManager()
    gameManager.playerOne.points = 100
    gameManager.winner = .one
    
    return WinnerView().environment(gameManager)
}

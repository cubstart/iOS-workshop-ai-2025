//
//  GameManager.swift
//  Hog
//
//  Created by Dylan Chhum on 6/15/25.
//
import SwiftUI

@Observable
class GameManager {
    var players: [Player] = [Player(playerID: 1), Player(playerID: 2)]
    var dices: [Dice] = []
    var currentPlayerIndex: Int = 0
    var isGameOver: Bool = false
    var winner: Player?
    let winningScore: Int = 100
    
    var currentPlayer: Player {
        players[currentPlayerIndex]
    }
    
    init() {
        resetGame()
    }
    
    func resetGame() {
        players = [Player(playerID: 1), Player(playerID: 2)]
        currentPlayerIndex = 0
        isGameOver = false
        winner = nil
        dices.removeAll()
    }
    
}

    

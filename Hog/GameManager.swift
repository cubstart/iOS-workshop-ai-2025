//  GameManager.swift
//  Hog
//
//  Created by Dylan Chhum on 6/15/25.
//

import Observation
import SwiftUI

enum PlayerNumber: String {
    case one = "One"
    case two = "Two"
}

class Player {
    var playerColor: Color
    var points: Int
    
    init(playerColor: Color, points: Int = 0) {
        self.playerColor = playerColor
        self.points = points
    }
}

@Observable
class GameManager {
    var playerOne = Player(playerColor: .blue)
    var playerTwo = Player(playerColor: .red)
    var dices: [Dice] = []
    var currentPlayerTurn = PlayerNumber.one
    var winner: PlayerNumber?
    var isGameOver: Bool = false
    
    @ObservationIgnored
    let goalScore: Int = 100
    
    var currentPlayer: Player {
        switch currentPlayerTurn {
        case .one:
            return playerOne
        case .two:
            return playerTwo
        }
    }
    
    init() {
        resetGame()
    }

    func resetGame() {
        playerOne.points = 0
        playerTwo.points = 0
        currentPlayerTurn = .one
        isGameOver = false
        winner = nil
        dices.removeAll()
    }

    func rollDice(amount : Int) {
        dices.removeAll()

        for _ in 0..<amount {
            let randomIndex = Int.random(in: 0..<DiceValue.allCases.count - 1)
            dices.append(Dice(value: DiceValue.allCases[randomIndex]))
        }

        let points = tabulateScore()
        currentPlayer.points += points
        
        let didCurrentPlayerWin = currentPlayer.points >= goalScore ? true : false

        if didCurrentPlayerWin {
            isGameOver = true
            winner = currentPlayerTurn
        } else {
            currentPlayerTurn = currentPlayerTurn == .one ? .two : .one
        }
    }

    private func tabulateScore() -> Int {
        var sum = 0
        for dice in dices {
            let value = dice.value.numericalValue
            if value == 1 {
                return 1
            } else {
                sum += value
            }
        }
        return sum
    }
}

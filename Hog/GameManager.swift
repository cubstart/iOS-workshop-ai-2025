//
//  GameManager.swift
//  Hog
//
//  Created by Dylan Chhum on 6/15/25.
//
import SwiftUI

@Observable
class GameManager {
    var players: [Player] = [Player(), Player()]
    var dices: [Dice] = []
    var currentPlayerIndex: Int = 0
    var isGameOver: Bool = false
    var winner: Player?
    let winningScore: Int = 100
    
    //Check
    var currentPlayer: Player {
        players[currentPlayerIndex]
    }
    
    init() {
        resetGame()
    }
    
    func resetGame() {
        players = [Player(), Player()]
        currentPlayerIndex = 0
        isGameOver = false
        winner = nil
        dices.removeAll()
    }
    
    func endTurn() {
        currentPlayerIndex = calcIndex()
    }
    
    private func calcIndex() -> Int {
        return (currentPlayerIndex + 1) % players.count
    }
    
    private func gameOver() {
        if currentPlayer.points >= winningScore {
            isGameOver = true
            winner = currentPlayer
        }
    }
    
    func rollDice(amount : Int) {
        dices.removeAll()
        for _ in 0..<amount {
            let randomValue = Int.random(in: 1...6)
            //Is this too much
            dices.append(Dice(value: DiceValue(rawValue: String(randomValue)) ?? .one))
        }
        
        let points = calcScore()
        players[currentPlayerIndex].points += points
        
        gameOver()

    }
    
    private func calcScore() -> Int {
        var sum = 0
        for dice in dices {
            //Same for this
            let value = Int(dice.value.rawValue) ?? 0
            if value == 1 {
                return 1
            } else {
                sum += value
            }
        }
            
            return sum
        }
    
}

    

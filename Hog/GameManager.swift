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
    //Could Omit Show that later
    func rollDice(amount : Int) {
        dices.removeAll()
        for _ in 0..<amount {
            let randomValue = Int.random(in: 1...6)
            dices.append(Dice(value: DiceValue(rawValue: String(randomValue)) ?? .one))
        }
        
        let points = calcScore()
        
        //Ask why doesnt it work
        players[currentPlayerIndex].points += points
        
        gameOver()

    }
    
    private func calcScore() -> Int {
        var sum = 0
        
        //Game punishes for hitting ones so maybe fix later
        for dice in dices {
            let value = Int(dice.value.rawValue) ?? 0
            if value == 1 {
                return 1
            } else if value % 3 == 0 || value % 4 == 0 {
                return nextPrime(after: currentPlayer.points)
            } else {
                sum += value
            }
        }
        return sum
    }
    
    
    //Ignore
    private func nextPrime(after n: Int) -> Int {
        var candidate = n + 1
        while true {
            if isPrime(candidate) {
                return candidate
            }
            candidate += 1
        }
    }

    private func isPrime(_ n: Int) -> Bool {
        if n <= 1 { return false }
        if n <= 3 { return true }
        if n % 2 == 0 || n % 3 == 0 { return false }

        var i = 5
        while i * i <= n {
            if n % i == 0 || n % (i + 2) == 0 {
                return false
            }
            i += 6
        }
        return true
    }
    
    
}

    

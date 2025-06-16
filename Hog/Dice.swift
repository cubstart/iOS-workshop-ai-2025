//
//  Dice.swift
//  Hog
//
//  Created by Justin Wong on 6/15/25.
//

import Foundation

enum DiceValue: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case question = "question"
}

struct Dice: Identifiable {
    var value: DiceValue
    let id = UUID()
    
    var imageName: String {
        return "dice_\(value.rawValue)"
    }
}

//
//  Dice.swift
//  Hog
//
//  Created by Justin Wong on 6/15/25.
//

import Foundation

enum DiceValue: String, CaseIterable {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case question = "question"
    
    var numericalValue: Int {
        switch self {
        case .one:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        case .five:
            return 5
        case .six:
            return 6
        default:
            return 0
        }
    }
}

struct Dice: Identifiable {
    var value: DiceValue
    let id = UUID()
    
    var imageName: String {
        return "dice_\(value.rawValue)"
    }
}

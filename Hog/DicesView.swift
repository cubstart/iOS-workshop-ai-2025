//
//  DicesView.swift
//  Hog
//
//  Created by Justin Wong on 6/15/25.
//

import SwiftUI

struct DicesView: View {
    var dices: [Dice]
    
    private let columns = [
        GridItem(.fixed(70)),
        GridItem(.fixed(70)),
        GridItem(.fixed(70)),
        GridItem(.fixed(70)),
        GridItem(.fixed(70))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(dices) { dice in
                Image(dice.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            }
        }
    }
}

#Preview {
    DicesView(dices: [
        Dice(value: .five),
        Dice(value: .five),
        Dice(value: .question),
        Dice(value: .one),
        Dice(value: .three),
        Dice(value: .question),
        Dice(value: .four),
        Dice(value: .six),
        Dice(value: .one),
        Dice(value: .two)
    ])
}

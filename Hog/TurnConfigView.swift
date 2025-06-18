//
//  TurnConfigView.swift
//  Hog
//
//  Created by Justin Wong on 6/15/25.
//

import SwiftUI

struct TurnConfigView: View {
    @Environment(\.dismiss) private var dismiss
    
    var gameManager: GameManager
    
    @State private var numOfDices = 1
    @State private var questionDices: [Dice] = []
    
    var body: some View {
        NavigationView {
            VStack {
                dicePicker
                DicesView(dices: questionDices)
                Spacer()
            }
            .padding()
            .navigationTitle("Configure Turn")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 25))
                            .foregroundStyle(.gray)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        gameManager.rollDice(amount: numOfDices)
                        dismiss()
                    }) {
                        Text("Done")
                            .bold()
                    }
                }
            }
            .onChange(of: numOfDices, initial: true) { _, newValue in
                questionDices.removeAll()

                for index in 0..<newValue {
                    let delay = Double(index) * 0.1
                    withAnimation(.bouncy(duration: 0.5).delay(delay)) {
                        questionDices.append(Dice(value: .question))
                    }
                }
            }
        }
    }
    
    private var dicePicker: some View {
        HStack {
            Text("Number of Dices:")
                .bold()
            
            Picker("Number of Dices", selection: $numOfDices) {
                ForEach(1..<11) { diceNum in
                    Text("\(diceNum)")
                        .tag(diceNum)
                }
            }
           Spacer()
        }
    }
}

#Preview {
    TurnConfigView(gameManager: GameManager())
}

//
//  ContentView.swift
//  Hog
//
//  Created by Justin Wong on 6/14/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingConfigTurnSheet = false
    
    var body: some View {
        ZStack {
            Color.green.opacity(0.2)
                .ignoresSafeArea()
            VStack {
                headerView
                Spacer()
                DicesView(dices: [
                    Dice(value: .one),
                    Dice(value: .two),
                    Dice(value: .one),
                    Dice(value: .two),
                    Dice(value: .one),
                    Dice(value: .two),
                    Dice(value: .one),
                    Dice(value: .two)
                ])
                Spacer()
                takeTurnButton
            }
            .padding()
        }
        .sheet(isPresented: $isShowingConfigTurnSheet) {
            TurnConfigView()
                .presentationCornerRadius(40)
        }
    }
    
    private var headerView: some View {
        HStack {
            Text("GOAL: \(100)")
                .font(.title)
                .fontWeight(.semibold)
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                Text("Player 1: \(30)")
                    .foregroundStyle(.blue)
                Text("Player 2: \(63)")
            }
            .font(.system(size: 20))
            .fontWeight(.semibold)
        }
    }
    
    private var takeTurnButton: some View {
        Button(action: {
            withAnimation {
                isShowingConfigTurnSheet.toggle()
            }
        }) {
            HStack {
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 35))
                    .foregroundStyle(.regularMaterial)
                Spacer()
                Text("Take Turn")
                    .bold()
                    .font(.title2)
                    .foregroundStyle(.white)
                Spacer()
            }
            .padding()
            .frame(width: 300)
            .background(.green)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

#Preview {
    ContentView()
}

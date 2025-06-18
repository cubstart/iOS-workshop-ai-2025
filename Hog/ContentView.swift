//
//  ContentView.swift
//  Hog
//
//  Created by Justin Wong on 6/14/25.
//

import SwiftUI

struct ContentView: View {
    @State var gameManager = GameManager()
    @State private var isShowingConfigTurnSheet = false
    
    var body: some View {
        ZStack {
            Color.green.opacity(0.2)
                .ignoresSafeArea()
            VStack {
                headerView
                Spacer()
                dicesView
                Spacer()
                takeTurnButton
            }
            .padding()
            
            if gameManager.winner != nil {
                WinnerView()
                    .environment(gameManager)
            }
        }
        .sheet(isPresented: $isShowingConfigTurnSheet) {
            TurnConfigView(gameManager: gameManager)
                .presentationCornerRadius(40)
        }
    }
    
    private var headerView: some View {
        HStack {
            Text("GOAL: \(gameManager.goalScore)")
                .font(.title)
                .fontWeight(.semibold)
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                Text("Player 1: \(gameManager.playerOne.points)")
                    .foregroundStyle(gameManager.currentPlayerTurn == .one ? .blue : .black)
                Text("Player 2: \(gameManager.playerTwo.points)")
                    .foregroundStyle(gameManager.currentPlayerTurn == .two ? .blue : .black)
            }
            .font(.system(size: 20))
            .fontWeight(.semibold)
        }
    }
    
    @ViewBuilder
    private var dicesView: some View {
        if gameManager.dices.isEmpty {
            Text("🐷")
                .font(.system(size: 100))
        } else {
            DicesView(dices: gameManager.dices)
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

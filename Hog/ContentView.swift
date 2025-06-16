//
//  ContentView.swift
//  Hog
//
//  Created by Justin Wong on 6/14/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingConfigTurnSheet = false
    @State private var gameManager = GameManager()
    
    var body: some View {
        ZStack {
            Color.green.opacity(0.2)
                .ignoresSafeArea()
            VStack {
                headerView
                Spacer()
                DicesView(dices: gameManager.dices)
                Spacer()
                takeTurnButton
            }
            .padding()
        }
        .sheet(isPresented: $isShowingConfigTurnSheet) {
            TurnConfigView(gameManager: gameManager)
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
                //Fix later getting sleepy
                Text("Player 1: \(gameManager.players[0].points)")
                    .foregroundStyle(.blue)
                Text("Player 2: \((gameManager.players[1].points))")
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

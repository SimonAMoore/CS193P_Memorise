//
//  EmojiMemoryGameView.swift
//  Memorise
//
//  Created by Simon Moore on 29/03/2025.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("Memorise!").font(.largeTitle)
            Text(viewModel.title).font(.title)
            cards.animation(.default, value: viewModel.cards)
                .foregroundColor(viewModel.color)
            Spacer()
            HStack {
                Spacer()
                Text("Score: \(viewModel.score)")
                Spacer()
                Button("New Game") {
                    viewModel.newGame()
                }
                Spacer()
            }
        }
        .padding()
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(spacing)
                .onTapGesture { viewModel.choose(card) }
        }
    }
    
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}

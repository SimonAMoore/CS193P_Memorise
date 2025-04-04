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
            ScrollView {
                cards.animation(.default, value: viewModel.cards)
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        //.foregroundColor(.orange)
    }
    
    struct CardView: View {
        let card: MemoryGame<String>.Card
        
        init(_ card: MemoryGame<String>.Card) {
            self.card = card
        }
        
        var body: some View {
            ZStack {
                let base = RoundedRectangle(cornerRadius: 16)
                
                Group {
                    base.fill(.white)
                    Text(card.content)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: .fit)
                    base.strokeBorder(lineWidth: 4)
                }
                .opacity(card.isFaceUp ? 1 : 0)
                
                base.fill().opacity(card.isFaceUp ? 0 : 1)
            }
            .opacity((card.isMatched ? 0 : 1))
            .foregroundColor(.orange)
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}

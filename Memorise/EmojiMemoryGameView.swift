//
//  EmojiMemoryGameView.swift
//  Memorise
//
//  Created by Simon Moore on 29/03/2025.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame = EmojiMemoryGame() // BAD!!!!!
    
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
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
                    base.strokeBorder(lineWidth: 4)
                    Text(card.content).font(.largeTitle)
                }
                .opacity(card.isFaceUp ? 1 : 0)
                
                base.fill().opacity(card.isFaceUp ? 0 : 1)
            }
        }
    }
}

#Preview {
    EmojiMemoryGameView()
}

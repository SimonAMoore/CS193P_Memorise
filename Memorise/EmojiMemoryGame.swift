//
//  EmojiMemoryGame.swift
//  Memorise
//
//  Created by Simon Moore on 03/04/2025.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 16) { pairIndex in
            var emoji = "⁉️"
            if emojis.indices.contains(pairIndex) {
                emoji = emojis[pairIndex]
            }
            return emoji
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.Choose(card: card)
    }
}

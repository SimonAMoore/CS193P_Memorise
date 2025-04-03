//
//  EmojiMemoryGame.swift
//  Memorise
//
//  Created by Simon Moore on 03/04/2025.
//

import SwiftUI

class EmojiMemoryGame {
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 12) { pairIndex in
            var emoji = "⁉️"
            if emojis.indices.contains(pairIndex) {
                emoji = emojis[pairIndex]
            }
            return emoji
        }
    }
    
    private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.Choose(card: card)
    }
}

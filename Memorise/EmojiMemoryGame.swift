//
//  EmojiMemoryGame.swift
//  Memorise
//
//  Created by Simon Moore on 03/04/2025.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static func createMemoryGameWith(_ theme: MemoryGameTheme<String>) -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: theme.numberOfPairs) { pairIndex in
            var emoji = "⁉️"
            if theme.emojis.indices.contains(pairIndex) {
                emoji = theme.emojis[pairIndex]
            }
            return emoji
        }
    }
    
    private var emojiThemes = EmojiMemoryGameThemes()
    
    @Published private var model: MemoryGame<String>

    init() {
        model = EmojiMemoryGame.createMemoryGameWith(emojiThemes.currentTheme)
        model.shuffle()
    }
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    var themeTitle: String {
        emojiThemes.currentTheme.name
    }
    
    var themeColor: Color {
        switch emojiThemes.currentTheme.color.lowercased() {
        case "red":
            return .red
        case "green":
            return .green
        case "orange":
            return .orange
        case "yellow":
            return .yellow
        case "purple":
            return .purple
        case "teal":
            return .teal
        case "brown":
            return .brown
        case "pink":
            return .pink
        case "cyan":
            return .cyan
        case "indigo":
            return .indigo
        case "mint":
            return .mint
        case "white":
            return .white
        default:
            return .black
        }
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.Choose(card: card)
    }
    
    func newGame() {
        model = EmojiMemoryGame.createMemoryGameWith(emojiThemes.randomTheme())
        model.shuffle()
    }
}

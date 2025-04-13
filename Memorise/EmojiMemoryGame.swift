//
//  EmojiMemoryGame.swift
//  Memorise
//
//  Created by Simon Moore on 03/04/2025.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card

    private static func createMemoryGameWith(_ theme: MemoryGameTheme<String>) -> MemoryGame<String> {
        //MemoryGame(choosePairsOfCards: 2, fromPairsOfCards: theme.contents.count) { pairIndex in
        //    theme.contents[pairIndex]
            MemoryGame(choosePairsOfCards: theme.numberOfPairs, fromPairsOfCards: theme.contents.count) { pairIndex in
                theme.contents[pairIndex]
            }
        }
    
    private let emojiThemes = EmojiMemoryGameThemes()
    private var theme: MemoryGameTheme<String>
    
    @Published private var model: MemoryGame<String>

    init() {
        theme = EmojiMemoryGameThemes.firstTheme()
        model = Self.createMemoryGameWith(theme)
        model.newGame()
    }
    
    var cards: [Card] {
        model.cards
    }
    
    var title: String {
        return theme.name
    }
    
    var color: Color {
        switch theme.color.lowercased() {
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
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.Choose(card: card)
    }
    
    func newGame() {
        theme = EmojiMemoryGameThemes.randomTheme()
        model = EmojiMemoryGame.createMemoryGameWith(theme)
        model.newGame()
    }
}

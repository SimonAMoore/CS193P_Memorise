//
//  MemoriseGame.swift
//  Memorise
//
//  Created by Simon Moore on 03/04/2025.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func Choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}

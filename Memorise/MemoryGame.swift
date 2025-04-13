//
//  MemoryGame.swift
//  Memorise
//
//  Created by Simon Moore on 03/04/2025.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    init(choosePairsOfCards: Int, fromPairsOfCards: Int, cardContent: (Int) -> CardContent) {
        cards = []
        
        let numbersToChooseFrom = Set(0..<fromPairsOfCards).shuffled()
        
        for pairIndex in 0..<max(2, choosePairsOfCards) {
            let content = cardContent(numbersToChooseFrom[pairIndex])
            cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
        }
    }
    
    mutating func Choose(card: Card) {
        if let chosenIndex = cards.firstIndex(of: card) {
            if card.isFaceDown && card.isNotMatched {
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                        score += 2
                    } else {
                        if cards[chosenIndex].isSeen { score -= 1 }
                        if cards[potentialMatchIndex].isSeen { score -= 1 }
                        cards[chosenIndex].isSeen = true
                        cards[potentialMatchIndex].isSeen = true
                    }
                } else {
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    mutating func newGame() {
        cards.indices.forEach {
            cards[$0].isFaceUp = true // false
            cards[$0].isMatched = false
            cards[$0].isSeen = false
        }
        //shuffle()
        score = 0
    }
    
    private(set) var score: Int = 0
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp = false
        var isMatched = false
        var isSeen = false
        
        let content: CardContent
        let id: String
        
        var debugDescription: String { "[\(id): '\(content)': Face \(isFaceUp ? "up" : "down"), \(isSeen ? "been seen" : "not seen"), \(isMatched ? "is" : "is not") matched.] " }
        var isFaceDown: Bool { !isFaceUp }
        var isNotMatched: Bool { !isMatched }
        var isActive: Bool { isFaceUp || isMatched }
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}

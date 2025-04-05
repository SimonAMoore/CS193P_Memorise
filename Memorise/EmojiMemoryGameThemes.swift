//
//  EmojiMemoryGameThemes.swift
//  Memorise
//
//  Created by Simon Moore on 05/04/2025.
//

import Foundation

struct EmojiMemoryGameThemes {
    private var themes: [MemoryGameTheme<String>] = []
    private var currentThemeIndex: Int
    
    init() {
        themes.append(MemoryGameTheme(name: "Sports",
                                           emojis: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🎱", "🥊"],
                                           numberOfPairs: 8,
                                           color: "yellow"))
        
        themes.append(MemoryGameTheme(name: "Animals",
                                           emojis: ["🐶", "🐱", "🐭", "🐰", "🦊", "🦁", "🐸", "🐷", "🐻", "🐨","🦆","🙉"],
                                           numberOfPairs: 10,
                                           color: "mint"))
        
        themes.append(MemoryGameTheme(name: "Halloween",
                                           emojis: ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"],
                                           numberOfPairs: 12,
                                           color: "orange"))
        
        themes.append(MemoryGameTheme(name: "Vehicles",
                                           emojis: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜","✈️","🛵","🏍️","⛵️"],
                                           numberOfPairs: 14,
                                           color: "indigo"))

        themes.append(MemoryGameTheme(name: "Emojis",
                                           emojis: ["😀", "😁", "😆", "🥹", "😅", "😂", "🤣", "🥲", "☺️", "😇", "🙃", "😉", "😍", "😘", "😝", "😎", "🥸", "🤩", "🥳", "🤯", "🥶", "🥵", "🤮", "🤕"],
                                           numberOfPairs: 16,
                                           color: "purple"))

        themes.append(MemoryGameTheme(name: "Food",
                                           emojis: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍒", "🍑", "🥥", "🥑", "🥦", "🥒", "🧄", "🧅", "🥐", "🥨", "🧀", "🍕", "🥚", "🌭"],
                                           numberOfPairs: 18,
                                           color: "teal"))
        
        currentThemeIndex = 0
    }
    
    var currentTheme: MemoryGameTheme<String> {
        themes[currentThemeIndex]
    }
    
    mutating func randomTheme() -> MemoryGameTheme<String> {
        currentThemeIndex = Int.random(in: themes.indices)
        return themes[currentThemeIndex]
    }
}

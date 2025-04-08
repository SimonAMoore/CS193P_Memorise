//
//  EmojiMemoryGameThemes.swift
//  Memorise
//
//  Created by Simon Moore on 08/04/2025.
//

import Foundation

struct EmojiMemoryGameThemes {
    private static var content = [MemoryGameTheme<String>]()
    
    private static func initialise() {
        content.append(MemoryGameTheme(name: "Sports",
                                       contents: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉", "🎱", "🥊"],
                                       numberOfPairs: 8,
                                       color: "yellow"))
        
        content.append(MemoryGameTheme(name: "Animals",
                                       contents: ["🐶", "🐱", "🐭", "🐰", "🦊", "🦁", "🐸", "🐷", "🐻", "🐨","🦆","🙉"],
                                       numberOfPairs: 10,
                                       color: "mint"))
        
        content.append(MemoryGameTheme(name: "Halloween",
                                       contents: ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"],
                                       numberOfPairs: 10,
                                       color: "orange"))
        
        content.append(MemoryGameTheme(name: "Vehicles",
                                       contents: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜","✈️","🛵","🏍️","⛵️"],
                                       numberOfPairs: 15,
                                       color: "indigo"))
        
        content.append(MemoryGameTheme(name: "Emojis",
                                       contents: ["😀", "😁", "😆", "🥹", "😅", "😂", "🤣", "🥲", "☺️", "😇", "🙃", "😉", "😍", "😘", "😝", "😎", "🥸", "🤩", "🥳", "🤯", "🥶", "🥵", "🤮", "🤕"],
                                       numberOfPairs: 15,
                                       color: "purple"))
        
        content.append(MemoryGameTheme(name: "Food",
                                       contents: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐", "🍒", "🍑", "🥥", "🥑", "🥦", "🥒", "🧄", "🧅", "🥐", "🥨", "🧀", "🍕", "🥚", "🌭"],
                                       numberOfPairs: 18,
                                       color: "teal"))
        
    }
    
    private static func getContentAtIndex(_ index: Int) -> MemoryGameTheme<String> {
        if (content.count == 0) { initialise() }
        return content[index]
    }
    
    static func firstTheme() -> MemoryGameTheme<String> {
        getContentAtIndex(0)
    }
    
    static func randomTheme() -> MemoryGameTheme<String> {
        getContentAtIndex(Int.random(in: content.indices))
    }
    
    static func add(_ theme: MemoryGameTheme<String>) {
        content.append(theme)
    }
}

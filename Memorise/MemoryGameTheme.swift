//
//  MemoryGameTheme.swift
//  Memorise
//
//  Created by Simon Moore on 04/04/2025.
//

import Foundation

struct MemoryGameTheme<ThemeContent:Equatable>: Equatable {
    let name: String
    let contents: Array<ThemeContent>
    let numberOfPairs: Int
    let color: String
}


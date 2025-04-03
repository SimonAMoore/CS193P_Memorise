//
//  MemoriseApp.swift
//  Memorise
//
//  Created by Simon Moore on 29/03/2025.
//

import SwiftUI

@main
struct MemoriseApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}

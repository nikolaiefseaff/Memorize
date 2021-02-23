//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Nicholas Efseaff on 11/13/20.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject private var emojiMemoryGame = EmojiMemoryGame.init()
    
    var body: some Scene {
        WindowGroup {
            return EmojiMemoryGameView(viewModel: emojiMemoryGame)
        }
    }
}

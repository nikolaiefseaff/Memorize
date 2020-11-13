//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Nicholas Efseaff on 11/13/20.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
        }
    }
}

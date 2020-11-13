//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Nicholas Efseaff on 11/13/20.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["🐠", "🐟", "🐡"]
        return MemoryGame<String>(numberOfPairsOfCard: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }

}

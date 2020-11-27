//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Nicholas Efseaff on 11/13/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    //@Published is a reactive wrapper. It will give us 'objectWillChange.send()' for free whenever this var changes. That way, dont have to add many extra lines in each "Intent"
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["🐠", "🐟", "🐡", "🐙", "🦑"]
        
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { providedPairIndex in
            emojis[providedPairIndex]
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

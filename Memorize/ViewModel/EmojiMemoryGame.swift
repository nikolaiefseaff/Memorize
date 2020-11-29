//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Nicholas Efseaff on 11/13/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    //@Published is a reactive wrapper. It will give us 'objectWillChange.send()' for free whenever this var changes. That way, dont have to add many extra lines in each "Intent"
    @Published private var model: MemoryGame<String>
    
    // MARK: - Init
    init(emojiTheme: EmojiTheme) {
        self.model = EmojiMemoryGame.createMemoryGame(emojiTheme: emojiTheme)
    }
    
    static func createMemoryGame(emojiTheme: EmojiTheme) -> MemoryGame<String> {
        return MemoryGame<String>(themeSelected: emojiTheme) { providedPairIndex, theme in
            theme.emojies[providedPairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var theme: Theme {
        model.theme
    }
    
    // MARK: - Intent
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}

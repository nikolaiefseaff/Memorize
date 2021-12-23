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
    typealias Card = MemoryGame<String>.Card
    
    // MARK: - Init
    init(emojiTheme: EmojiTheme) {
        self.model = EmojiMemoryGame.createMemoryGame(emojiTheme: emojiTheme)
    }
    
    init() {
        let randomTheme = EmojiTheme.allCases.randomElement()!
        self.model = EmojiMemoryGame.createMemoryGame(emojiTheme: randomTheme)
    }
    
    static func createMemoryGame(emojiTheme: EmojiTheme) -> MemoryGame<String> {
        return MemoryGame<String>(themeSelected: emojiTheme) { providedPairIndex, theme in
            theme.emojies[providedPairIndex]
        }
    }
            
    // MARK: - Access to the Model
    // View-only computed vars of the model
    var cards: Array<Card> {
        model.cards
    }
    
    var theme: Theme {
        model.theme
    }
    
    var themeName: String {
        model.theme.name
    }
    
    var score: Int {
        model.score
    }
    
    // MARK: - Intent
    
    func choose(card: Card) {
        model.choose(card: card)
    }
    
    func newGame(withTheme theme: EmojiTheme) {
        self.model = EmojiMemoryGame.createMemoryGame(emojiTheme: theme)
    }
    
    func newGame() {
        let randomTheme = EmojiTheme.allCases.randomElement()!
        self.model = EmojiMemoryGame.createMemoryGame(emojiTheme: randomTheme)
    }
        
}

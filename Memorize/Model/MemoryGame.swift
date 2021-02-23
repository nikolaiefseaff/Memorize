//
//  MemoryGame.swift
//  Memorize
//
//  Created by Nicholas Efseaff on 11/13/20.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var theme: Theme
    var cards: Array<Card>
    var indexOfOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else { //no cards are face up
                indexOfOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    mutating func newTheme() {
        let randomTheme = EmojiTheme.allCases.randomElement()!
        theme = randomTheme
    }
    
    mutating func setupModel(withTheme themeSelected: EmojiTheme, cardContentFactory: (Int, Theme) -> CardContent)  {
        theme = Theme(emojiTheme: themeSelected)
        cards = Array<Card>()
        let numberOfPairsOfCards = theme.difficulty.getDifficulty()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex, theme)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    init(themeSelected: EmojiTheme, cardContentFactory: (Int, Theme) -> CardContent)  {
        theme = Theme(emojiTheme: themeSelected)
        cards = Array<Card>()
        let numberOfPairsOfCards = theme.difficulty.getDifficulty()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex, theme)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int //can be string or whatever
    }
    
}


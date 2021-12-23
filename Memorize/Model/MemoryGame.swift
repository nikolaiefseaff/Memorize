//
//  MemoryGame.swift
//  Memorize
//
//  Created by Nicholas Efseaff on 11/13/20.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var theme: Theme
    private(set) var cards: Array<Card>
    var score = 0
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
                    score += 2
                }
                else if cards[chosenIndex].content != cards[potentialMatchIndex].content { //no match
                    if cards[chosenIndex].isSeen == true { score -= 1 } else {
                        cards[chosenIndex].isSeen = true }
                    if cards[potentialMatchIndex].isSeen == true { score -= 1 } else {                     cards[potentialMatchIndex].isSeen = true }
                }
                cards[chosenIndex].isFaceUp = true
            } else { //no cards are face up
                indexOfOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    //setup game
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
        var isFaceUp = false
        var isMatched = false
        var isSeen = false
        let content: CardContent
        let id: Int //can be string or whatever
    }
    
}


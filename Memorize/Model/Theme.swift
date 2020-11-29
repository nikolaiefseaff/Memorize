//
//  Theme.swift
//  Memorize
//
//  Created by Nicholas Efseaff on 11/27/20.
//

import SwiftUI

struct Theme {
    var emojiTheme: EmojiTheme
    var name: String
    var emojies: [String]
    var color: Color
    var difficulty: Difficulty
    
    init(emojiTheme: EmojiTheme) {
        self.emojiTheme = emojiTheme
        
        switch self.emojiTheme {
        case .aquarium:
            self.name = "Aquarium"
            self.emojies = ["🐠", "🐟", "🐡", "🐙", "🦑", "🐬", "🦀", "🦈", "🐳", "🐚", "🐋"]
            self.color = Color.blue
            self.difficulty = .random(pairs: ProvidedDifficulty.easy.rawValue, maxPairsAllowed: self.emojies.count)
        case .halloween:
            self.name = "Halloween"
            self.emojies = ["🎃", "👻", "🍭", "🍬", "🍂", "🕸", "😱", "🦴"]
            self.color = Color.orange
            self.difficulty = .provided(pairs: ProvidedDifficulty.easy.rawValue, maxPairsAllowed: self.emojies.count)
        case .food:
            self.name = "Food"
            self.emojies = ["🧀","🌶", "🌽", "🌭", "🥐", "🍞", "🍕", "🍩", "🍰"]
            self.color = Color.green
            self.difficulty = .provided(pairs: ProvidedDifficulty.easy.rawValue, maxPairsAllowed: self.emojies.count)
        case .animal:
            self.name = "Animals"
            self.emojies = ["🐥", "🐣", "🐯", "🐨", "🐭", "🐶", "🐷", "🐸", "🐹", "🐻", "🐼", "🦁"]
            self.color = Color.red
            self.difficulty = .provided(pairs: ProvidedDifficulty.medium.rawValue, maxPairsAllowed: self.emojies.count)
        case .activity:
            self.name = "Activities"
            self.emojies = ["🏄🏻‍♀️", "🤾🏾‍♂️", "⛹🏻‍♀️", "🏊🏾‍♂️", "🤺", "🏋🏼‍♂️", "🤽🏻‍♂️", "🏂", "⛷"]
            self.color = Color.purple
            self.difficulty = .provided(pairs: ProvidedDifficulty.medium.rawValue, maxPairsAllowed: self.emojies.count)
        case .space:
            self.name = "Space"
            self.emojies = ["🚀", "👽", "🛰", "🌘", "🌖", "🌓", "🌒", "🌕", "🌑", "🪐", "🌎", "☀️"]
            self.color = Color.black
            self.difficulty = .provided(pairs: ProvidedDifficulty.hard.rawValue, maxPairsAllowed: self.emojies.count)
        case .smiley:
            self.name = "Smilies"
            self.emojies = ["😇", "😄", "😅", "😉", "🤣", "😝", "😘", "🤤", "🙃", "🙂", "☺️", "🥰", "😎", "💩"]
            self.color = Color.yellow
            self.difficulty = .provided(pairs: ProvidedDifficulty.hard.rawValue, maxPairsAllowed: self.emojies.count)
        }
    }
}

enum EmojiTheme {
    case aquarium
    case halloween
    case food
    case animal
    case activity
    case space
    case smiley
}

enum Difficulty {
    case provided(pairs: Int, maxPairsAllowed: Int)
    case random(pairs: Int, maxPairsAllowed: Int)
    
    func getDifficulty() -> Int {
        switch self {
        case .provided(let desiredDifficultyPairs, let maxPairsAllowed):
            let allowedPairs = min(desiredDifficultyPairs, maxPairsAllowed)
            return allowedPairs
        case .random(let desiredDifficultyPairs, let maxPairsAllowed):
            if desiredDifficultyPairs > maxPairsAllowed {
                let randomNumber = Int.random(in: desiredDifficultyPairs...maxPairsAllowed)
                return randomNumber
            } else {
                let randomNumber = Int.random(in: 2...maxPairsAllowed)
                return randomNumber
            }
        }
    }
}

enum ProvidedDifficulty : Int {
    case easy = 5
    case medium = 8
    case hard = 12
}

//
//  FooterView.swift
//  Memorize
//
//  Created by Nikolai Efseaff on 12/17/21.
//

import SwiftUI

struct FooterView: View {
    //@ObservedObject is a reactive wrapper. It will redraw each time it recieves a ".send()" from a VM
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        ScrollView (.horizontal) {
            emojiBar(viewModel: game)
        }
    }
}

struct emojiBar: View {
    //@ObservedObject is a reactive wrapper. It will redraw each time it recieves a ".send()" from a VM
    @ObservedObject var viewModel: EmojiMemoryGame

    init(viewModel: EmojiMemoryGame) {
        self.viewModel = viewModel
    }

    var body: some View {
        HStack(alignment: .center) {
            newEmojiGameButton(viewModel: viewModel, emojiLabel: "drop", theme: .aquarium)
            newEmojiGameButton(viewModel: viewModel, emojiLabel: "leaf", theme: .fall)
            newEmojiGameButton(viewModel: viewModel, emojiLabel: "briefcase", theme: .food)
            newEmojiGameButton(viewModel: viewModel, emojiLabel: "pawprint", theme: .animal)
            newEmojiGameButton(viewModel: viewModel, emojiLabel: "sportscourt", theme: .activity)
            newEmojiGameButton(viewModel: viewModel, emojiLabel: "moon", theme: .space)
            newEmojiGameButton(viewModel: viewModel, emojiLabel: "face.smiling", theme: .smiley)
        }
        .scaledToFill()
    }
}

struct newEmojiGameButton: View {
    //@ObservedObject is a reactive wrapper. It will redraw each time it recieves a ".send()" from a VM
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var emojiLabel: String
    var theme: EmojiTheme
    
    init(viewModel: EmojiMemoryGame, emojiLabel: String, theme: EmojiTheme) {
        self.viewModel = viewModel
        self.emojiLabel = emojiLabel
        self.theme = theme
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 5.0) {
            Button {
                viewModel.newGame(withTheme: theme)
            } label: {
                Image(systemName: emojiLabel)
                    .font(.system(size: 25, weight: .regular))
            }
            .accentColor(Color.black)
            .scaledToFit()
            Text(emojiLabel)
                .accentColor(Color.primary)
                .font(.system(size: 15, weight: .light))
        }
        .padding(.horizontal)
        .frame(minWidth: 100, idealWidth: 125, maxWidth: 130)
    }
}
















struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame(emojiTheme: .animal)
        FooterView(game: game)
            .previewLayout(.sizeThatFits)
    }
}

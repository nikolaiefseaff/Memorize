//
//  GameView.swift
//  Memorize
//
//  Created by Nikolai Efseaff on 12/23/21.
//

import SwiftUI

struct GameView: View {
    //@ObservedObject is a reactive wrapper. It will redraw each time it recieves a ".send()" from a VM
    @ObservedObject var game: EmojiMemoryGame

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 90, maximum: 500))]) {
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card: card)
                        }
                }
                .padding(.horizontal, 1.0)
                .foregroundColor(game.theme.color)
            }
            .scaledToFill()
            .padding(.horizontal)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game: EmojiMemoryGame(emojiTheme: .animal))
    }
}

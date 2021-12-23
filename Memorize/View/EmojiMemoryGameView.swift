//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Nicholas Efseaff on 11/13/20.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    //@ObservedObject is a reactive wrapper. It will redraw each time it recieves a ".send()" from a VM
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            HeaderView(game: game)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 90, maximum: 500))]) {
                    ForEach(game.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fill)
                            .onTapGesture {
                                game.choose(card: card)
                            }
                    }
                    .padding(.all, 3.0)
                    .foregroundColor(game.theme.color)
                }
                .scaledToFill()
            }
            
            FooterView(game: game)
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cardCornerRadius)
                        .stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else {
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: cardCornerRadius).fill()
                    }
                }
            }
            .font(Font.system(size:fontSize(for: geometry.size)))
        }
    }
    
    // MARK: - Drawing Constants
    
    let cardCornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 4
    let fontScalar: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScalar
    }
}























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame(emojiTheme: .animal)
        EmojiMemoryGameView(game: game)
            .previewInterfaceOrientation(.portrait)
    }
}

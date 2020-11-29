//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Nicholas Efseaff on 11/13/20.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    //@ObservedObject is a reactive wrapper. It will redraw each time it recieves a ".send()" from on VM
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            // TODO: Score from model
            HeaderView(score: 150, themeName: viewModel.theme.name)
                        
            Grid(items: viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
                .padding(5)
            }
            .padding()
            .foregroundColor(viewModel.theme.color)
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
                    //.fill(Color.yellow)
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
        EmojiMemoryGameView(viewModel: game)
    }
}

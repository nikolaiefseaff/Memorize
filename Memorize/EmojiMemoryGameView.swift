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
        Grid(items: viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                viewModel.choose(card: card)
            }
            .padding(5)
        }
        .padding()
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cardCornerRadius).stroke().fill(Color.white)
                    RoundedRectangle(cornerRadius: cardCornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else {
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: cardCornerRadius).fill(Color.orange)
                    }
                }
            }
            .font(Font.system(size:fontSize(for: geometry.size)))
        }
    }
    
    // MARK: - Drawing Constants
    
    let cardCornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    let fontScalar: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScalar
    }
}






















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(viewModel: game)
    }
}

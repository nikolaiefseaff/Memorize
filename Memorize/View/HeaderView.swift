//
//  HeaderView.swift
//  Memorize
//
//  Created by Nicholas Efseaff on 11/28/20.
//

import SwiftUI

struct HeaderView: View {
    //@ObservedObject is a reactive wrapper. It will redraw each time it recieves a ".send()" from a VM
    @ObservedObject var game: EmojiMemoryGame
        
    var body: some View {
        HStack {
            VStack {
                Text(game.theme.name)
                    .scaledToFill()
                    .padding(5)

                Button {
                    game.newGame()
                } label: {
                    Image(systemName: "plus.square")
                        .font(.system(size: 40, weight: .regular))
                }
                .accentColor(Color.primary)
            }
              
            Text("Memorize")
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .scaledToFit()

            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 4)
                    .fill()
                HStack {
                    Text(String(game.score))
                }
                .scaledToFit()
                .padding(.horizontal)
            }
            .frame(minWidth: 40, idealWidth: 50, maxWidth: 90, minHeight: 40, idealHeight: 50, maxHeight: 90, alignment: .trailing)
        }
        .frame(minWidth: 300, maxWidth: .infinity, minHeight: 30, idealHeight: 45, maxHeight: 60, alignment: .center)
        .padding(.all)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(game: EmojiMemoryGame(emojiTheme: .animal))
            .previewLayout(.sizeThatFits)
    }
}

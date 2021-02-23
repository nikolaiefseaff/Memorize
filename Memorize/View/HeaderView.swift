//
//  HeaderView.swift
//  Memorize
//
//  Created by Nicholas Efseaff on 11/28/20.
//

import SwiftUI

struct HeaderView: View {
    var score: Int
    var themeName: String
    
    init(score: Int, themeName: String) {
        self.score = score
        self.themeName = themeName
    }
    
    var body: some View {
        HStack {
            VStack {
                Text(themeName)
                    .scaledToFill()
                    .padding(5)
                
                Button(action: {
                        print("pressed button")})
                {
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
                .scaledToFill()

            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 4)
                    .fill()
                HStack {
                    Text(String(score))
                }
                .scaledToFit()
                .padding(.horizontal)
            }
            .frame(minWidth: 40, idealWidth: 50, maxWidth: 90, minHeight: 40, idealHeight: 50, maxHeight: 90, alignment: .trailing)
        }
        .frame(minWidth: 300, maxWidth: .infinity, minHeight: 50, idealHeight: 70, maxHeight: 90, alignment: .center)
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(score: 100, themeName: "Aquatic")
            .previewLayout(.fixed(width: 375, height: 100))
    }
}

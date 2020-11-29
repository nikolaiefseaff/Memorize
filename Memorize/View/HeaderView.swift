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
                        
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3)
                    .fill()
                    .padding(5)
                HStack {
                    Text("Score")
                    Text(String(score))
                }
            }
            .padding(10)
            
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

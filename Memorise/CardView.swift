//
//  CardView.swift
//  Memorise
//
//  Created by Simon Moore on 12/04/2025.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    
    let card: Card
    
    init(_ card: Card) {
        self.card = card
    }
        
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            
            Group {
                base.fill(.white)
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.inset)
                base.strokeBorder(lineWidth: Constants.lineWidth)
            }
            .opacity(card.isActive ? 1 : 0)
            
            base.fill().opacity(card.isActive ? 0 : 1)
        }
        .opacity((card.isMatched ? Constants.matchedOpacity : 1))
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 16
        static let lineWidth: CGFloat = 4
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        static let matchedOpacity: CGFloat = 0.25
    }
}

#Preview {
    typealias Card = CardView.Card

    return VStack {
        HStack {
            CardView(Card(isFaceUp: true, content: "X", id: "test1"))
            CardView(Card(isFaceUp: true, content: "X", id: "test2"))
        }
        HStack {
            CardView(Card(isFaceUp: true, content: "This is a very long string so I hope it fits.", id: "test3"))
            CardView(Card(isFaceUp: true, content: "X", id: "test4"))
        }
    }
        .padding()
        .foregroundColor(.green)
}


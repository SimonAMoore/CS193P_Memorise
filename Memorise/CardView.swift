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
        Pie(endAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
            )
            .padding(Constants.inset)
            .cardify(isActive: card.isActive)
            .opacity((card.isMatched ? Constants.matchedOpacity : 1))
    }
    
    private struct Constants {
        static let inset: CGFloat = 4
        static let matchedOpacity: CGFloat = 0.25

        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }

        struct Pie {
            static let opacity: CGFloat = 0.4
            static let inset: CGFloat = 4
        }
    }
}

#Preview {
    VStack {
        HStack {
            CardView(CardView.Card(isFaceUp: true, content: "X", id: "test1"))
            CardView(CardView.Card(isFaceUp: true, content: "X", id: "test2"))
        }
        HStack {
            CardView(CardView.Card(isFaceUp: true, content: "This is a very long string so I hope it fits.", id: "test3"))
            CardView(CardView.Card(isFaceUp: true, content: "X", id: "test4"))
        }
    }
        .padding()
        .foregroundColor(.green)
}

//
//  ContentView.swift
//  Memorise
//
//  Created by Simon Moore on 29/03/2025.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"]
    
    var body: some View {
        ScrollView {
            cards
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: gridSizeFor(count: emojis.count)))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    func gridSizeFor(count: Int) -> CGFloat {
        count < 32 ? 65.0 : 50.0
    }
    
    struct CardView: View {
        @State var isFaceUp = false
        
        var cornerRadius    = 16.0
        var lineWidth       = 4.0
        
        let content: String
        
        var body: some View {
            ZStack {
                let base = RoundedRectangle(cornerRadius: cornerRadius)
                
                Group {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: lineWidth)
                    Text(content).font(.largeTitle)
                }
                .opacity(isFaceUp ? 1 : 0)
                
                base.fill().opacity(isFaceUp ? 0 : 1)
            }
            .onTapGesture {
                isFaceUp.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}

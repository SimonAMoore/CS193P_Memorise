//
//  ContentView.swift
//  Memorise
//
//  Created by Simon Moore on 29/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State var emojis: Array<String> = []
    @State var themeColor: Color = Color(.white)
    
    var body: some View {
        VStack {
            Text("Memorise!").font(.largeTitle)
            ScrollView {
                cards
            }
            Spacer()
            themeChoosingButtons
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
        .foregroundColor(themeColor)
    }
    
    func gridSizeFor(count: Int) -> CGFloat {
        count < 32 ? 65.0 : 50.0
    }
    
    func themeChoosingButton(emojis content: Array<String>, title: String, symbol: String, color: Color) -> some View {
        Button(action: {
            emojis = [content, content].flatMap( { $0 } ).shuffled()
            themeColor = color
        }, label: {
            VStack {
                Image(systemName: symbol).font(.largeTitle)
                Text(title)
            }
        })
    }
    
    var themeChoosingButtons: some View {
        HStack(alignment: .lastTextBaseline) {
            Spacer()
            themeChoosingButton(emojis: ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "😱", "☠️", "🍭"], title: "Halloween", symbol: "brain.fill", color: .orange)
            Spacer()
            themeChoosingButton(emojis: ["✈️", "🚗", "🚀", "🚘", "🚙", "🚎", "🚛", "🚕", "🚐", "🚁", "🚜", "⛵️", "🚒", "🏎️", "🏍️", "🚔"], title: "Vehicles", symbol: "car.fill", color: .red)
            Spacer()
            themeChoosingButton(emojis: ["🐱", "🐈", "🐶", "🐿️", "🦊", "🐷", "🐮", "🐼", "🦆", "🦦"], title: "Animals", symbol: "pawprint.fill", color: .green)
            Spacer()
        }
    }
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

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Memorise
//
//  Created by Simon Moore on 29/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var cornerRadius: CGFloat = 16
    var lineWidth: CGFloat = 4
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).foregroundColor(.white)
                RoundedRectangle(cornerRadius: cornerRadius).strokeBorder(lineWidth: lineWidth)
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius)
            }
        }
    }
}

#Preview {
    ContentView()
}

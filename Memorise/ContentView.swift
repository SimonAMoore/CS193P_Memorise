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
    @State var isFaceUp        = false  // Temporary State (pointer)
    var cornerRadius    = 16.0
    var lineWidth       = 4.0
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: cornerRadius)
            
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: lineWidth)
                Text("👻").font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}

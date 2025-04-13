//
//  Cardify.swift
//  Memorise
//
//  Created by Simon Moore on 13/04/2025.
//

import SwiftUI

struct Cardify: ViewModifier {
    let isActive: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            
            base.strokeBorder(lineWidth: Constants.lineWidth)
                .background(base.fill(.white))
                .overlay(content)
                .opacity(isActive ? 1 : 0)
            
            base.fill().opacity(isActive ? 0 : 1)
        }
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 16
        static let lineWidth: CGFloat = 4
    }
}

extension View {
    func cardify(isActive: Bool) -> some View {
        modifier(Cardify(isActive: isActive))
    }
}

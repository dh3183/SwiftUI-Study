//
//  ElbinVStack.swift
//  ViewBuilder
//
//  Created by 한빈 on 2023/01/28.
//

import SwiftUI

struct ElbinVStack<Content>: View where Content: View {
    let content: () -> Content
    let color: Color
    
    init(color: Color = .clear,
         @ViewBuilder content: @escaping () -> Content) {
        self.color = color
        self.content = content
    }
    
    var body: some View {
        VStack {
            content()
        }
        .background(color)
    }
}

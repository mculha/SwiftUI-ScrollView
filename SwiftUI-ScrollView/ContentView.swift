//
//  ContentView.swift
//  SwiftUI-ScrollView
//
//  Created by Melih Çulha on 15.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    let colors: [Color] = [.red, .orange, .yellow, .green, .cyan, .blue, .purple]
    private let cellHorizontalSpace: CGFloat = 150
    
    
    var body: some View {
        GeometryReader { proxy in
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(colors, id: \.self) { color in
                        RoundedRectangle(cornerRadius: 25)
                            .fill(color.gradient)
                            .frame(width: (proxy.size.width - cellHorizontalSpace) , height: 200)
                            .scrollTransition(topLeading: .interactive,
                                              bottomTrailing: .interactive,
                                              axis: .horizontal) { view, phase in
                                view
                                    .opacity(1 - (phase.value < 0 ? -phase.value : phase.value))
                                    .scaleEffect(1 - (phase.value < 0 ? -phase.value / 5 : phase.value / 5))
                            }
                    }
                }
                .padding(.horizontal, cellHorizontalSpace / 2)
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .padding(.horizontal, 0)
        }
    }
}

#Preview {
    ContentView()
}

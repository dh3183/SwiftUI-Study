//
//  ContentView.swift
//  Gestures
//
//  Created by 한빈 on 2023/02/07.
//

import SwiftUI

struct ContentView: View {
    @State var singleTapped = false
    @State var doubleTapped = false
    @State var tripleTapped = false
    
    var singleTap: some Gesture {
        TapGesture()
            .onEnded { _ in
                print("한번 탭했다.")
                singleTapped.toggle()
            }
    }
    
    var doubleTap: some Gesture {
        TapGesture(count: 2)
            .onEnded { _ in
                print("두번 탭했다.")
                doubleTapped.toggle()
            }
    }
    
    var tripleTap: some Gesture {
        TapGesture(count: 3)
            .onEnded { _ in
                print("세번 탭했다.")
                tripleTapped.toggle()
            }
    }
    
    var body: some View {
        VStack {
            Circle()
                .fill(singleTapped ? Color.blue : .gray)
                .frame(width: 100, height: 100, alignment: .center)
                .overlay(Text("싱글탭").circleTitle())
                .gesture(singleTap)
            
            Circle()
                .fill(doubleTapped ? Color.orange : .gray)
                .frame(width: 100, height: 100, alignment: .center)
                .overlay(Text("더블탭").circleTitle())
                .gesture(doubleTap)
            
            Circle()
                .fill(tripleTapped ? Color.green : .gray)
                .frame(width: 100, height: 100, alignment: .center)
                .overlay(Text("트리플탭").circleTitle())
                .gesture(tripleTap)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CircleTitle: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(size: 26)).foregroundColor(.white)
    }
}

extension View {
    func circleTitle() -> some View {
        modifier(CircleTitle())
    }
}

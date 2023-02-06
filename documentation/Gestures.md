# Gestures
<img src="https://user-images.githubusercontent.com/83414134/217061700-ed7b0253-b869-4988-b995-3d3fb60ac076.gif" width="300">

> Define interactions from taps, clicks, and swipes to fine-grained gestures.

* SwiftUI View엔 Gesture 인식기가 연결될 수 있고 이러한 Gesture 인식기는 인식기가 활성화될 때 실행될 클로저를 차례로 연결할 수 있음.
* Gesture를 감지하는 변수를 GestureState 키워드를 통해 바인딩을 하여 변수가 True 일 때만 Gesture를 실행하는 식으로 Gesture를 제공하고 있음.

### Gesture의 종류
* TapGesture: 하나 이상의 탭을 인식하는 제스처
* LongPressGesture: 길게 누르면 인식하는 제스처
* DragGesture: 드래그 이벤트가 변경될 때 작업을 호출하는 제스처
* MagnificationGesture: 확대를 할 때 인식하는 제스처
* RotationGesture: 회전 동작을 인식하고 회전 각도를 추적하는 제스처

```Swift
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
```
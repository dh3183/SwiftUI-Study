## 🎁 ViewBuilder
> A custom parameter attribute that constructs views from closures.

### 🥑 Declaration
```Swift
@frozen struct Group<Content>
```
### 🥑 @ViewBuiler Prameter
```Swift
@inlinable public init(alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content)
```

* VStack의 생성자를 확인해보면 @ViewBuilder content parameter(Closure 타입)가 있는 것을 볼 수 있다.

* @ViewBuilder 파라미터를 두어 View를 구성할 수 있는 나만의 View(또는 비슷한 개념)로 Custom 할 수 있다.

```Swift
//  MainView.swift

struct MainView: View {
    var body: some View {
        ElbinVStack(color: .cyan) {
            Text("iOS")
            Text("Swift")
            Text("UIKit")
            Text("SwiftUI")
        }
    }
}
```

```Swift
//  ElbinVStack.swift

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
```

### 🥑 @ViewBuilder computed property, Method
첫번째 방법은 파라미터 앞에 @ViewBuilder가 붙었는데 @ViewBuilder는 computed Property나 메소드 앞에도 붙을 수 있다. 

```Swift
struct ContentView: View {            
    var body: some View {
        HStack {
            Text("Elbin")
            Text("Elbin")
            Text("Elbin")
            Text("Elbin")
            Text("Elbin")
            Text("Elbin")
            Text("Elbin")
            Text("Elbin")
        }
    }
}
```

body 블록안에 8개의 Text가 담긴 **HStack**이있다.
저 HStack을 **Computed Property**로 따로 빼고 싶다고 가정을 하면

```Swift
struct ContentView: View {
    var body: some View {
        manyTexts
    }
    
    var manyTexts: some View {
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
    }
}
```

<img width="980" src="https://user-images.githubusercontent.com/83414134/215265459-a85046f9-299b-4d43-b5e0-a40d3978eb44.png">

> Function declares an opaque return type, but has no return statements in its body from which to infer an underlying type

이렇게 오류를 뱉어냈다.

```Swift
struct ContentView: View {
                
    var body: some View {
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
    }

    var manyTexts: some View {
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
    }
}
```

* 우선 body는 컴파일이 되고 manyTexts는 컴파일 에러를 뱉어냈다.
* body 프로퍼티는 암시적으로 @ViewBuilder로 선언되어있기 때문이다. 
* 하지만, body외의 다른 프로퍼티나 메소드는 기본적으로 **ViewBuilder로 유추(infer)하지 않기 때문에 @ViewBuilder를 명시적으로 넣어줘야한다.**

```Swift
struct ContentView: View {
    var body: some View {
        manyTexts
    }
    
    @ViewBuilder
    var manyTexts: some View {
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
        Text("Elbin")
    }
}
```
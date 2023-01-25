### 🎁 Modifier
#### 🥑 Declaration
```Swift 
func modifier<T>(_ modifier: T) -> ModifiedContent<Self, T>
```

#### 🍞 Discussion
```Swift
struct BorderedCaption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1)
            )
            .foregroundColor(Color.blue)
    }
}
```

modifier(_:)는 View Modifier가 적용된 새로운 View를 만들어주고 리턴 시킨다.
예제 코드를 살펴보면 modifier(_:)를 사용해 View와 ViewModifier를 결합해 새로운 View를 만들어서 리턴하는 것을 알 수 있다.

#### 🍞 modifier 순서
modifier는 각 메소드를 수행하면서 새로운 뷰를 리턴하기 때문에 순서에 따라 다른 결과가 나타날 수 있기 때문에 순서를 고려하여 코드를 작성해야 한다.
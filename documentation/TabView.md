<img src="https://user-images.githubusercontent.com/83414134/206871221-2aa0f3bf-10da-43cb-ba2d-06c8cbe908e7.png" width="200px"> <img src="https://user-images.githubusercontent.com/83414134/206871228-fe5e7ae8-2aa7-4cec-87c3-df43e53872d1.png" width="200px"> <img src="https://user-images.githubusercontent.com/83414134/206871231-d701a78e-ea11-4cd7-b0a3-655dc428f2f4.png" width="200px">

## 🎁 TabView


### 🖥️ Code

```Swift
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            FirstV()
                .tabItem{
                    Image(systemName: "house")
                    Text("홈")
                }
            SecondV()
                .tabItem{
                    Image(systemName: "plus")
                    Text("추가")
                }
            ThirdV()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }
        }.tint(Color.teal)
            .onAppear(){
                UITabBar.appearance().barTintColor = .brown
            }
    }
}
```

### 🥑 TabView (Structure)
> A view that switches between multiple child views using interactive user interface elements.

#### 🍞 Declaration
```Swift
struct TabView<SelectionValue, Content> where SelectionValue : Hashable, Content : View
```

#### 🍞 OverView
To create a user interface with tabs, place views in a TabView and apply the tabItem(_:) modifier to the contents of each tab. On iOS, you can also use one of the badge modifiers, like badge(_:), to assign a badge to each of the tabs.

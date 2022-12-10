### 🎁 Modal (feat. 보노보노)
<img src="https://user-images.githubusercontent.com/83414134/206870686-257d2f38-6bb9-4840-8b8d-7d3d7ca4f69b.gif" width="300">

```Swift
//  Main.swift

import SwiftUI

struct Main: View {
    @State private var isShowingSheet = false
    
    var body: some View {
        VStack{
            Text("모달은 수달")
            Button(action: {
                self.isShowingSheet = true
            }){
                Text("깔깔깔 🤭").bold()
            }
            .frame(width: 100, height: 50, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 10).fill(.green))
            .font(.system(size: 16))
            .foregroundColor(Color.white)
            .sheet(isPresented: self.$isShowingSheet) {
                ModalView()
            }
        }
    }
}
```

Main View에선 modal로 이동하는것에 대한 검증을 위해 Bool 변수를 선언했고 VStack안에 Text와 Button을 배치해 Button을 터치 시 Modal이 나타나게 했다.

```Swift
.sheet(isPresented: self.$isShowingSheet) {
                ModalView()
            }
```

Button의 action은 isShowingSheet을 true로 변경시키면 sheet의 isPresented로 인해 ModalView로 이동하게 된다.

### 🥑 Documentation

#### 🍞 Declaration
Presents a sheet when a binding to a Boolean value that you provide is true.

#### 🍞 Parameters
* **isPresented**
A binding to a Boolean value that determines whether to present the sheet that you create in the modifier’s content closure.

* **onDismiss**
The closure to execute when dismissing the sheet.

* **content**
A closure that returns the content of the sheet.

```Swift
func sheet<Content>(
    isPresented: Binding<Bool>,
    onDismiss: (() -> Void)? = nil,
    content: @escaping () -> Content
) -> some View where Content : View
```
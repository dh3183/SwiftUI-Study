<img src="https://user-images.githubusercontent.com/83414134/206871813-176c7565-649f-4673-8c34-aa93e826d1b2.png" width="200"> <img src="https://user-images.githubusercontent.com/83414134/206871814-e38539c0-1b3a-4441-83df-ed66ab18b3d9.png" width="200"> <img src="https://user-images.githubusercontent.com/83414134/206871815-d917caaf-c105-463d-a242-0e8103b43df7.png" width="200">

### 🖥️ Code
```Swift
import SwiftUI

struct MainView: View {
    @State var selected = 1
    
    var body: some View {
        VStack {
            Picker(selection: $selected, label: Text("Picker"), content: {
                Text("판매중").tag(1)
                Text("거래완료").tag(2)
                Text("숨김").tag(3)
            })
            .pickerStyle(SegmentedPickerStyle())
            
            if selected == 1 {
                Homeview()
            } else if selected == 2 {
                ClearView()
            } else {
                HideView()
            }
        }
    }
}
```

### 🥑Picker (Structure)
> A control for selecting from a set of mutually exclusive values.

#### 🍞 Declaration
```Swift
struct Picker<Label, SelectionValue, Content> where Label : View, SelectionValue : Hashable, Content : View
```

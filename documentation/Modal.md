### Modal (feat. 보노보노)
<img src="https://velog.velcdn.com/images/elbin/post/16c70ac2-275f-4563-99f5-13f084fab63f/image.gif" width="200">

```Swift
//  Main.swift

import SwiftUI

struct Main: View {
    @State private var showModal = false
    
    var body: some View {
        VStack{
            Text("모달은 수달")
            Button(action: {
                self.showModal = true
            }){
                Text("깔깔깔 🤭").bold()
            }
            .frame(width: 100, height: 50, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 10).fill(.green))
            .font(.system(size: 16))
            .foregroundColor(Color.white)
            .sheet(isPresented: self.$showModal) {
                ModalView()
            }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
```

Main View에선 modal로 이동하는것에 대한 검증을 위해 Bool 변수를 선언했고 VStack안에 Text와 Button을 배치해 Button을 터치 시 Modal이 나타나게 했다.
showModal을

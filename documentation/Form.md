## 🎁 Form
<span>
<img width="198" src="https://user-images.githubusercontent.com/83414134/210690266-9069b902-3dc8-4dab-8aad-fdd95a5e43cc.png">
<img width="206" src="https://user-images.githubusercontent.com/83414134/210690275-43ae57c1-3abb-44dd-bd68-233c506dc1db.png">
<img width="200" src="https://user-images.githubusercontent.com/83414134/210690285-758499cc-90c0-4692-becf-36bdbe7d3334.png">
<img width="200" src="https://user-images.githubusercontent.com/83414134/210690288-75fffb5b-0638-44dd-a88a-2bc482a2cb81.png">
</span>

* settings 혹은 inspectors와 같이 데이터 입력에 사용되는 컨트롤을 그룹화하기위한 컨테이너다.
* HTML의 Form과 유사하다.

### 🥑 Form : Declaration
```Swift
struct Form<Content> where Content : View
```

## 🎁 Section
* Collection view 계층을 추가하는데 사용할 수 있는 container view다. 
* List, Picker 및 Form과 같은 View에서 Section 인스턴스를 사용하여 내용을 별도의 Section으로 구성합니다. 
* 각 Section에는 사용자가 인스턴스별로 제공하는 사용자 정의 콘텐츠가 있습니다. 
* 각 Section에 대한 header 및 Footer를 제공할 수도 있습니다.

### 🥑 Section : Declaration
```Swift
struct Section<Parent, Content, Footer>
```

> 해당 문서의 이미지는 iOS의 설정 화면을 Clone하여 구현헀다.

## 🥑 Group
> A type that collects multiple instances of a content type — like views, scenes, or commands — into a single unit.

"View, Scenes, Command와 같은 content type의 여러 인스턴스를 하나의 단위로 수집하는 유형"이라고라고 한다.

* Group을 사용해 여러 뷰를 single instance로 수집할 때 HStack, VStack 또는 Section과 같은 View의 레이아웃에 영향을 주지 않습니다.
* Group을 만든 후 Group에 적용하는 모든 modifier는 해당 Group의 모든 member들에게 영향을 미칩니다.
* 예를 들어, 다음 코드는 Group의 세 개의 View에 Headline font를 적용합니다.

```Swift
HStack {
    Group {
        Text("SwiftUI")
        Text("Combine")
        Text("Swift System")
    }
    .font(.headline)
}
VStack {
    Group {
        Text("SwiftUI")
        Text("Combine")
        Text("Swift System")
    }
    .font(.headline)
}
HStack {
    Group {
        Text("SwiftUI")
        Text("Combine")
        Text("Swift System")
    }
    .font(.headline)
}
```

## 🥑 GroupBox
> A stylized view, with an optional label, that visually collects a logical grouping of content.

content의 logical 그룹과 연관된 optional label이 있는 stylized view다.

### 🍞 GroupBox: Declaration
```Swift
struct GroupBox<Label, Content> where Label : View, Content : View
```

### 🍞 GroupBox: Example
<img width="300" src="https://user-images.githubusercontent.com/83414134/215262630-f22c3df4-6938-4a5e-810d-67877d24f064.png">

```Swift
var body: some View {
    GroupBox(label:
                Label("End-User Agreement", systemImage: "building.columns")
    ) {
        ScrollView(.vertical, showsIndicators: true) {
            Text(agreementText)
                .font(.footnote)
        }
        .frame(height: 100)
        Toggle(isOn: $userAgreed) {
            Text("I agree to the above terms")
        }
    }
}
```
사용자 인터페이스의 일부를 상자에 표시된 내용에 대한 optional Title과 기본적으로 배경색이 들어가기 때문에 시각적으로 구분해준다.

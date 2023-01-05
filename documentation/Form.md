## 🎁 Form
<span>
<img width="198" src="https://user-images.githubusercontent.com/83414134/210690266-9069b902-3dc8-4dab-8aad-fdd95a5e43cc.png">
<img width="206" src="https://user-images.githubusercontent.com/83414134/210690275-43ae57c1-3abb-44dd-bd68-233c506dc1db.png">
<img width="200" src="https://user-images.githubusercontent.com/83414134/210690285-758499cc-90c0-4692-becf-36bdbe7d3334.png">
<img width="200" src="https://user-images.githubusercontent.com/83414134/210690288-75fffb5b-0638-44dd-a88a-2bc482a2cb81.png">
</span>

* settings 혹은 inspectors와 같이 데이터 입력에 사용되는 컨트롤을 그룹화하기위한 컨테이너다.

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

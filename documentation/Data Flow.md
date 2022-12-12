b## 🎁 Data Flow
> 본 문서는 WWDC19의 Data Flow Through SwiftUI를 시청 후 이를 기반으로 정리한 문서입니다.

* SwiftUI는 훌륭한 앱을 만드는 최단 경로이지만 UI의 복잡성을 해결한다는 목표로 처음부터 설계했으며 이것은 <b>일급 객체(first class citizen)</b>를 의미
* SwiftUI는 항상 정확하고 일관된 데이터 표현을 보장하도록 보기 계층을 업데이트함

### 🥑 2 Principles
#### 🍞 First, every time you read a piece of data in your view, you're creating a dependency for that view.

> _뷰에서 데이터를 읽을 때마다, 뷰에는 데이터에 대한 의존이 발생함_

<img src="https://user-images.githubusercontent.com/83414134/206924993-63699db1-cfa7-4387-a5c9-b27e60033209.jpg" width="500">

* 파란색(PlayerView)이 보라색(isPlaying)의 값을 읽어야 한다고 할 때, 보라색 값이 변경될 때(True or False)마다 View를 업데이트 해야 한다.

그러나 SwiftUI는 수동 동기화 또는 무효화의 과정이 없기 때문에, SwiftUI로 몇가지 Tool을 사용하여 프레임워크에 대한 의존성을 간단히 선언하면 프레임워크가 나머지를 모두 처리하고, 사용자에게 최상의 환경을 제공하는데에 집중할 수 있다.

#### 🍞 Second, that every piece of data that you're reading in your view hierarchy has a source of truth.

> _뷰의 계층에서 읽어들이는 모든 데이터들은 Source of Truth를 가진다_

<img src="https://user-images.githubusercontent.com/83414134/206925284-50588a70-b740-4759-b923-f22b9ce09218.jpg" width="500">

뷰에서 읽는 모든 데이터들은 결국 하나의 원천을 가진다는 뜻 (Source of Truth)

<img src="https://velog.velcdn.com/images/marisol/post/e41bb7ae-0de8-452a-9866-1c9ad02ae518/image.png" width="500">

위의 그림에서는 isPlaying의 데이터가 존재한다. Notification, KV observing, 그 외의 다른 이벤트 등으로 응답하는 모든 복잡성이 버그를 어떻게 발생시켰는지 생각해보면.. 👀

<img src="https://user-images.githubusercontent.com/83414134/206925934-06fff30f-db49-4f2b-9f85-e0f665732274.jpg" width="500">

이런 식으로 데이터를 한 곳으로 모은 다음 두 개의 뷰가 그것을 참조하게 만든다면 데이터 간의 inconsistency bug를 제거할 수 있으며 또한, SwiftUI는 이 구조를 간단하게 만들 수 있도록 도와준다.

### 🥑 Example : Podcast player with SwiftUI
<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcMwVLv%2FbtqChGZ30N9%2FDG35EPoX86NUeCpHmsvLhk%2Fimg.png" width="500">

현재 코드는 아래와 같다.

**PlayerView의 프로퍼티** 
* episode : 현재 노출되고 있는 에피소드(let)
* isPlaying : 현재 재생중인지의 여부(var)

**body의 VStack**
* Text : episode.title
* Text : episode.showTitle
* Button : isPlaying.toggle

겉으로 봤을 때 문제가 없어 보이지만 실제로 컴파일 시 재생 버튼 액션부에서 오류가 발생한다.

<img src="https://user-images.githubusercontent.com/83414134/206926705-b9c738e8-7b53-4e76-8468-82475c7c3579.jpg" width="500">

> _Cannot use mutating member on immutable value: 'self'is immutable_
>
> **불변 값에서 가변 멤버를 사용할 수 없습니다: 함수 호출은 불변 값을 반환합니다.**

UI가 업데이트 될 때 마다 View의 body가 달라지는데, 이런 경우를 처리하기 위해 <b>@State</b>를 사용한다.

<img src="https://user-images.githubusercontent.com/83414134/206927058-629dd13d-9c1f-4db6-bb13-2719fafc5c28.jpg" width="500">

* 내부 프로퍼티에 @State Property Wrapper를 적용해 시스템에게 <b>"이 프로퍼티(isPlaying)의 값은 변경될 수 있으며, 이 값에 따라 Self(PlayerView)의 상태도 변경될 수 있다"</b>라고 알려준다.
* @State인 변수의 값이 변할 때 View의 렌더링이 달라져야 한다는 것을 SwiftUI가 감지한다.

<img src="https://user-images.githubusercontent.com/83414134/206927241-36fc2b16-871f-4c94-b6a2-ee425da691cd.jpg" width="500">

위의 구조에서 isPlaying의 값이 true로 변한다면

<img src="https://user-images.githubusercontent.com/83414134/206927303-0178ed22-f15d-47d8-b6e1-3ab9e63675b5.jpg" width="500">

##### 👀 Runtime data
* 상태가 변경되고 상태를 소유하는 View의 유효성을 검사하기 시작
* 즉, 해당 View의 본문과 모든 하위 항목이 다시 계산
* 모든 변경사항은 항상 View hierarchy를 통해 아래로 이동
* 프레임워크가 보기를 비교하고 변경된 것만 다시 렌더링하기 때문에 효율적

### 🥑 Every @State is a source of truth.
#### 🍞 Views are a function of state, not a sequence of events.

View는 이벤트의 연속이 아니라, 상태의 기능이다.
기존에는 View 계층을 직접 변경하여 일부 이벤트에 응답한다. (하위 View를 추가하거나, 제거하는 등)
SwiftUI는 View 선언적인 언어로서, 현재의 상태를 고려하여 View를 설명하며 app을 user와 device 사이의 지속적인 피드백 루프로 생각할 수 있다.

<img src="https://user-images.githubusercontent.com/83414134/206927959-1528cf74-9887-41b5-a2cf-69b338afaf13.jpg" width="500">

* 유저가 앱과 상호 작용하여 작업을 생성하고 작업은 프레임워크에 의해 실행되고 일부 상태를 변형시킨다.
* 시스템은 상태가 변경되었음을 감지하므로 상태에 따라 달라지는 View를 업데이트해야 함을 알 수 있다.
* 이 업데이트는 유저가 상호작용할 수 있는 새로운 버전의 UI를 생성한다.

데이터가 항상 단일 방향으로 흐르는 이 모델은, 뷰 업데이트를 예측 가능하고 쉽게 이해할 수 있다.
> 재생 중일 때와 일시중지 중일 때 타이틀 색을 다르게 하고 싶다면 코드를 간단하게 추가할 수도 있지만, View에서 의미있는 데이터를 더 작고 재사용 가능한 요소로 그룹화할 수 있다.

<img src="https://user-images.githubusercontent.com/83414134/207125695-369c599d-8ad7-4582-8999-00383d535670.jpg" width="500">

<img src="https://user-images.githubusercontent.com/83414134/207125948-ccb5556a-5d28-471a-bf59-8de527d0bbb4.jpg" width="500">

isPlaying을 변수로 선언하면 source of truth가 복제되기 때문에 이럴 때 사용하는 Property Wrapper는 **@Binding** 이라고 한다.

<img src="https://user-images.githubusercontent.com/83414134/207125975-d1f6fb5e-3c3a-452c-8241-6e65a7a039e5.jpg" width="500">

* **@Binding**을 사용해 Source of Truth를 작성하지 않고 해당 코드에 대한 명시적 의존성(Explicit Dependency)을 정의함
* **@Binding**은 @State에서 파생될 수 있기 때문에 초기 값을 제공할 필요가 없음

<img src="https://user-images.githubusercontent.com/83414134/207130268-8937892b-6bf1-459c-80a5-795228471c06.jpg" width="500">

> _SwiftUI 이전에 해왔던 방식_

기존의 방식에서는 View Controller의 SubView들이 동일한 Property를 각각 들고 있었다. View Controller의 목적은 View와 Data를 동기화 해야 함
(모델 변화를 관찰하고 그 사건에 대응해야 함)

이러한 모든 복잡성을 SwiftUI에서는 그렇지 않다. Data Dependency을 정의하는 간단한 도구가 있으며 프레임워크가 나머지를 모두 처리해 View Controller가 더 이상 필요하지 않다.

<img src="https://user-images.githubusercontent.com/83414134/207130278-66051b4b-2151-46ab-b221-f8c5a04a6d53.jpg" width="500">

하지만 **@Binding**을 활용하면 오직 하나의 데이터만을 관리하면 된다.
SwiftUI에서는 더 이상 그런 복잡한 관리를 일일히 할 필요가 없다. Data Dependency를 정의해놓기만 하면 프레임워크가 나머지를 알아서 해줄 것이다.

<img src="https://velog.velcdn.com/images/marisol/post/cb8dc8d3-285f-4b0d-b0e2-bcf3cc7ea5af/image.png" width="500">

PlayerView가 여전히 source of truth인 state를 가지고 있고, PlayButton은 해당 isPlaying에 $ prefix를 사용하여 바인딩해올 수 있다.

#### 🍞 The View Controller is no longer required

<img src="https://velog.velcdn.com/images/marisol/post/3637b808-1d27-4bb0-8e12-a80affa03cd3/image.png" width="500">

* Toggle, TextField, Slider 등은 이것을 가져다 쓰는 쪽에서의 Source of truth를 유지시켜 주기 위해 바인딩으로 구현되어 있다.
* 데이터를 생성한 후, 해당 정보를 복제하거나 수동으로 동기화 하지 않고, 참조를 제공한다.

SwiftUI View는 Layout, Navigation등을 볼 수 있는 많은 앱이며 단일 데이터에 대한 Presentation Logic을 캡슐화하는 데도 유용하다.

<img src="https://velog.velcdn.com/images/marisol/post/1c721054-27fc-42aa-98d5-be54d67d7fed/image.png" width="500">

#### 🍞 Working With External Data

<img src="https://user-images.githubusercontent.com/83414134/207138383-7d0e1b6c-8c27-44a8-9e49-c38263c46592.jpg" width="500">

<img src="https://velog.velcdn.com/images/marisol/post/7a76aaf3-4e9a-4c1b-8881-8e15faca5f6f/image.png" width="500">

SwiftUI에서는 데이터 관리를 위한 많은 방법들이 제공된다. 이제부터는 @Environment, @ObservableObject(당시 BindableObject)에 대해 알아본다.

SwiftUI에서는 외부 이벤트라도 결국은 State의 변화로 이어진다. 앞의 예제에서 유저의 인터랙션이 발생해 State가 변경되었던 것과 결과적으로는 별 차이가 없다.

SwiftUI에서는 이런 외부 이벤트들을 Publisher라고 통칭하고 Publisher는 Combine Framework로부터 발생된다.

#### 🍞 예제를 통해 Publisher 적용

<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FWlfv6%2FbtqCrOJVm2W%2FSoV7NkfMkJ1bqVIKkVLNUK%2Fimg.png" width="500">

우리의 목적은 SwiftUI와 함께 publishers를 사용할 때 기억해야 할 한 가지가 있다.
팟캐스트 플레이어(예제)에 타임스탬프를 추가하는 예제를 통해 설명한다.

> 해당 세션에선 Combine에 대해 자세한 설명은 하지 않으며 자세한 내용을 확인하려면 관련 세션을 확인해야 한다고 한다.

@State 변수인 currentTime 을 추가하였고 body에서 이 변수를 formatter에 기입했다.

<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbyxgMd%2FbtqCwWNzT3H%2Fcm34B5OKEKykRtg2UOEoEK%2Fimg.png" width="500">

VStack 하단에 onReceive modifire를 추가하였다. 
이제 타임스탬프가 변경되면 onReceive 블럭 안에서 currentTime 이 새로운 값으로 변경될 것이다. currentTime 은 State 변수이다. 따라서 State가 변경된 것으로 취급되고, body 를 통해 뷰의 렌더링이 다시 이루어진다. 그러면 currentTIme 에 대한 UI 갱신이 자동으로 이루어진다. 이런 과정을 거치는 동안 수동으로 작성된 코드나 invalid 체크 코드는 필요하지 않다는 것이 장점이다.

> onReceive 는 Combine에서 제공해주는 것으로, Publisher가 receive(on:) 메서드를 통해 특정 큐/쓰레드에서 돌도록 지정한 것을 여기서 받아 처리할 수 있게 된다. 
>
> 위 코드는 현재 타임스탬프가 변경될 때 fire되는 Publisher가 미리 작성되어 있다는 가정 하에 작성된 것.

### 🥑 BindableObject Protocol
<img src="https://velog.velcdn.com/images/marisol/post/3faf8546-c312-407e-9f11-f1e835c07625/image.png">

* BindableObject는 이미 가지고 있는, 잘 캡슐화된 모델을 사용하는 편리한 방법이다.
* SwiftUI는 BindableObject Protocol에 적합하게 하는 것이다.

<img src="https://velog.velcdn.com/images/marisol/post/c36ce6e0-9cc4-4359-80cf-21500b1f84ae/image.png">

SwiftUI는 데이터의 변화에 어떻게 반응해야 하는지만 알면 된다.
만약 팟캐스트(예제)가 모든 기기에서 동기화되기를 원한다면 Model을 PodcastPlayer View에 가져와야 하는데, BindableObject 프로토콜을 채택하기만 하면 된다.

<img src="https://velog.velcdn.com/images/marisol/post/9956d35d-b140-4645-9d53-df43d89afd1d/image.png">

<img src="https://user-images.githubusercontent.com/83414134/207144333-1fa8a556-6415-4f61-8732-9923c7aab46b.jpg">

@ObjectBinding property wrapper를 사용해 dependency을 생성하는 두 개를 연결할 수 있다.
이렇게 하면 property wrapper가 있는 각 뷰는 앞서 작성한 모델에 따라 달라진다.

@State와 마찬가지로 ObjectBinding property wrapper를 사용해 View에 추가하면 프레임워크에서 dependency가 있음을 인식한다. 데이터에 접근할 때 View를 언제 업데이트할지 자동으로 알아낸다. View를 생성할 때 ObjectBinding property wrapper를 View의 property에 추가한다. 그 다음 인스턴스화할 때는 이미 가지고 있는 모델에 참조를 전달하기만 하면 된다. 이것은 View의 initializer에 Explicit Dependency(명시적 의존성)을 생성한다. 왜냐하면 View를 인스턴스화할 때 View가 모델에 의존한다는 것을 알기 때문.


#### 🍞 Creating Dependencies Indirectly

<img src="https://user-images.githubusercontent.com/83414134/207147222-5f5d63ee-d5ec-4aab-b8a9-b975ac124647.jpg">

ObjectBinding property wrapper를 사용해 BindableObject를 Environment에 쓸 수 있다.
Environment property wrapper를 사용해 Model에 dependency를 생성할 수 있다. 계층 전체의 다양한 뷰에서 이 뷰를 사용할 수 있으며 모두 동일한 모델에 따라 달라집니다. 물론 데이터가 변경되면 모든 것이 자동으로 업데이트된다.
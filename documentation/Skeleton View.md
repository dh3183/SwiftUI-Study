## 🎁 Skeleton View
### 🥑 미리보는 완성
<img src="https://user-images.githubusercontent.com/83414134/207156244-bc377146-8b81-4be1-bcce-a9fb65348948.gif" width="200">  <img src="https://velog.velcdn.com/images%2Fdvhuni%2Fpost%2F273c77cb-5339-41eb-b5fe-7e22a72204f7%2F1.PNG" width="185">

당근마켓이나, 원티드의 서비스를 이용하시다 보면 데이터를 불러오는 동안
일반적인 Loading Indicator와는 다르게 미리 어떤 내용들이 있는지 대략적인 형태를 보여줍니다.

오늘날 거의 대부분의 앱들은 비동기 방식의 API 호출을 사용하는 프로세스를 가지고 있습니다. 프로세스가 작동하는동안 개발자들은 작업이 실행되고 있다는것을 사용자들에게 보여주기 위해서 로딩 뷰를 배치합니다.

SkeletonView는 이러한 필요에 의해 고안되었고, 사용자들에게 무엇인가 로딩이 되고 있다는것을 보여주면서 기다리는 콘텐츠에 대해서도 미리 준비할 수 있게 해주는 우아하게 표현할수 있는 방법입니다.

```Swift
// BlinkingAnimationModifier
import SwiftUI

struct BlinkingAnimationModifier: AnimatableModifier {

    var shouldShow : Bool
    
    var opacity: Double
    
    var animatableData: Double {
        get { opacity }
        set { opacity = newValue }
    }
    
    func body(content: Content) -> some View {
        content.overlay(
            ZStack{
                Color.white.zIndex(0)
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(.gray.opacity(0.5))
                    .opacity(self.opacity).zIndex(1)
            }.opacity(self.shouldShow ? 1 : 0)
        )
    }
}

extension View {
    func setSkeletonView(opacity: Double, shouldShow: Bool) -> some View {
        self.modifier(BlinkingAnimationModifier(shouldShow: shouldShow, opacity: opacity))
    }
}
```

MainView와 BlinkingAnimationModifier를 따로 분리해 개발하는것이 좋다.

```Swift
import SwiftUI
// MainView

struct BlogPost {
    
    let title: String
    let author: String
    let article: String
    
    static func getDummy() -> BlogPost{
        return BlogPost(title: "미소유 참조 질문에 대한 답변입니다 😉", author: "Elbin", article: "약한 참조와 같이 미소유 참조도 인스턴스의 참조 횟수를 증가시키지 않아요. 다른 점은 자신이 참조하는 인스턴스가 메모리에서 해제되더라도 스스로 nil을 할당하지 않는다는 점인데 그렇기 때문에, 변수나 프로퍼티는 옵셔널이나 변수가 아니어도 가능해요. 하지만 메모리에서 해제된 인스턴스에 접근하려 하면 잘못된 접근으로 오류가 발생할 수 있어요❗️ 따라서 미소유 참조는 참조하는 동안 그 인스턴스가 메모리에서 해제되지 않는다는 확인이 있을 때만 사용 해야해요🙋🏻‍♂️")
    }
}

struct ContentView: View {
    
    @State var post: BlogPost?
    
    @State var isLoading: Bool = false
    
    @State var opacity : Double = 1.0
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Image("cat")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .clipped()
                .frame(width: 60, height: 60)
                .setSkeletonView(opacity: opacity, shouldShow: post == nil)
                .padding(.bottom, 15)
            
            
            Text(post?.title ?? "포스트 타이틀이 없습니다.")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .setSkeletonView(opacity: opacity, shouldShow: post == nil)
                .padding(.bottom, 8)
            
            
            Text(post?.author ?? "포스트 작가입니다.")
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .setSkeletonView(opacity: opacity, shouldShow: post == nil)
                .padding(.bottom, 30)
            
            
            Text(post?.article ?? "약한 참조와 같이 미소유 참조도 인스턴스의 참조 횟수를 증가시키지 않아요. 다른 점은 자신이 참조하는 인스턴스가 메모리에서 해제되더라도 스스로 nil을 할당하지 않는다는 점인데 그렇기 때문에, 변수나 프로퍼티는 옵셔널이나 변수가 아니어도 가능해요. 하지만 메모리에서 해제된 인스턴스에 접근하려 하면 잘못된 접근으로 오류가 발생할 수 있어요❗️ 따라서 미소유 참조는 참조하는 동안 그 인스턴스가 메모리에서 해제되지 않는다는 확인이 있을 때만 사용 해야해요🙋🏻‍♂️")
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
                .setSkeletonView(opacity: opacity, shouldShow: post == nil)
            
            
            Spacer()
            
            Button(action: reloadData, label: {
                Image(systemName: "repeat")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).fill(.blue))
            })
            //                .unredacted()
            
            Spacer()
        }
        //            .redacted(reason: post == nil ? .placeholder : [])
        .padding(.horizontal, 20)
        //            .overlay(loadingView.opacity(isLoading ? 1 : 0))
        .onAppear(perform: {
            self.post = BlogPost.getDummy()
            withAnimation(.linear(duration: 1.5).repeatForever(autoreverses: true)) {
                //                    if opacity == 0.4 {
                //                        opacity = 0.8
                //                    } else {
                //                        opacity = 0.4
                //                    }
                self.opacity = opacity == 0.4 ? 0.8 : 0.4
            }
        })
    }
    
}

extension ContentView {
    fileprivate var loadingView : some View {
        Color.black.opacity(0.8).edgesIgnoringSafeArea(.all)
            .overlay(ProgressView().tint(.white))
    }
}

//MARK: - Helper
extension ContentView {
    
    // 데이터 갱신
    fileprivate func reloadData(){
        self.post = nil
        
        withAnimation{self.isLoading = true}
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            
            withAnimation{self.post = BlogPost.getDummy()}
            
            
            //            withAnimation{self.isLoading = false}
        })
    }
}
```

### ❗️ 주의점
스켈레톤은 콘텐츠의 로드를 방해하면안됨. 실제 콘텐츠 데이터가 로드되는 시점이되면 즉시 스켈레톤을 대체.
스켈레톤 디자인시 애니메이션 사용, wave 사용이 로딩시간을 짧게 느끼게함
느리고 안정적인 애니메이션을 사용하는 것이 로딩시간을 짧게 느끼게 함

{ 로딩 ? 스켈레톤 : 실제콘텐츠 }

스켈레톤은 실제 콘텐츠의 ui는 그대로 가져와 사용, 데이터는 없으므로 다른방식으로 표현할것

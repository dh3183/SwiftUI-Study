## ๐ Skeleton View
### ๐ฅ ๋ฏธ๋ฆฌ๋ณด๋ ์์ฑ
<img src="https://user-images.githubusercontent.com/83414134/207156244-bc377146-8b81-4be1-bcce-a9fb65348948.gif" width="200">  <img src="https://velog.velcdn.com/images%2Fdvhuni%2Fpost%2F273c77cb-5339-41eb-b5fe-7e22a72204f7%2F1.PNG" width="185">

๋น๊ทผ๋ง์ผ์ด๋, ์ํฐ๋์ ์๋น์ค๋ฅผ ์ด์ฉํ์๋ค ๋ณด๋ฉด ๋ฐ์ดํฐ๋ฅผ ๋ถ๋ฌ์ค๋ ๋์
์ผ๋ฐ์ ์ธ Loading Indicator์๋ ๋ค๋ฅด๊ฒ ๋ฏธ๋ฆฌ ์ด๋ค ๋ด์ฉ๋ค์ด ์๋์ง ๋๋ต์ ์ธ ํํ๋ฅผ ๋ณด์ฌ์ค๋๋ค.

์ค๋๋  ๊ฑฐ์ ๋๋ถ๋ถ์ ์ฑ๋ค์ ๋น๋๊ธฐ ๋ฐฉ์์ API ํธ์ถ์ ์ฌ์ฉํ๋ ํ๋ก์ธ์ค๋ฅผ ๊ฐ์ง๊ณ  ์์ต๋๋ค. ํ๋ก์ธ์ค๊ฐ ์๋ํ๋๋์ ๊ฐ๋ฐ์๋ค์ ์์์ด ์คํ๋๊ณ  ์๋ค๋๊ฒ์ ์ฌ์ฉ์๋ค์๊ฒ ๋ณด์ฌ์ฃผ๊ธฐ ์ํด์ ๋ก๋ฉ ๋ทฐ๋ฅผ ๋ฐฐ์นํฉ๋๋ค.

SkeletonView๋ ์ด๋ฌํ ํ์์ ์ํด ๊ณ ์๋์๊ณ , ์ฌ์ฉ์๋ค์๊ฒ ๋ฌด์์ธ๊ฐ ๋ก๋ฉ์ด ๋๊ณ  ์๋ค๋๊ฒ์ ๋ณด์ฌ์ฃผ๋ฉด์ ๊ธฐ๋ค๋ฆฌ๋ ์ฝํ์ธ ์ ๋ํด์๋ ๋ฏธ๋ฆฌ ์ค๋นํ  ์ ์๊ฒ ํด์ฃผ๋ ์ฐ์ํ๊ฒ ํํํ ์ ์๋ ๋ฐฉ๋ฒ์๋๋ค.

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

MainView์ BlinkingAnimationModifier๋ฅผ ๋ฐ๋ก ๋ถ๋ฆฌํด ๊ฐ๋ฐํ๋๊ฒ์ด ์ข๋ค.

```Swift
import SwiftUI
// MainView

struct BlogPost {
    
    let title: String
    let author: String
    let article: String
    
    static func getDummy() -> BlogPost{
        return BlogPost(title: "๋ฏธ์์  ์ฐธ์กฐ ์ง๋ฌธ์ ๋ํ ๋ต๋ณ์๋๋ค ๐", author: "Elbin", article: "์ฝํ ์ฐธ์กฐ์ ๊ฐ์ด ๋ฏธ์์  ์ฐธ์กฐ๋ ์ธ์คํด์ค์ ์ฐธ์กฐ ํ์๋ฅผ ์ฆ๊ฐ์ํค์ง ์์์. ๋ค๋ฅธ ์ ์ ์์ ์ด ์ฐธ์กฐํ๋ ์ธ์คํด์ค๊ฐ ๋ฉ๋ชจ๋ฆฌ์์ ํด์ ๋๋๋ผ๋ ์ค์ค๋ก nil์ ํ ๋นํ์ง ์๋๋ค๋ ์ ์ธ๋ฐ ๊ทธ๋ ๊ธฐ ๋๋ฌธ์, ๋ณ์๋ ํ๋กํผํฐ๋ ์ต์๋์ด๋ ๋ณ์๊ฐ ์๋์ด๋ ๊ฐ๋ฅํด์. ํ์ง๋ง ๋ฉ๋ชจ๋ฆฌ์์ ํด์ ๋ ์ธ์คํด์ค์ ์ ๊ทผํ๋ ค ํ๋ฉด ์๋ชป๋ ์ ๊ทผ์ผ๋ก ์ค๋ฅ๊ฐ ๋ฐ์ํ  ์ ์์ด์โ๏ธ ๋ฐ๋ผ์ ๋ฏธ์์  ์ฐธ์กฐ๋ ์ฐธ์กฐํ๋ ๋์ ๊ทธ ์ธ์คํด์ค๊ฐ ๋ฉ๋ชจ๋ฆฌ์์ ํด์ ๋์ง ์๋๋ค๋ ํ์ธ์ด ์์ ๋๋ง ์ฌ์ฉ ํด์ผํด์๐๐ปโโ๏ธ")
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
            
            
            Text(post?.title ?? "ํฌ์คํธ ํ์ดํ์ด ์์ต๋๋ค.")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .setSkeletonView(opacity: opacity, shouldShow: post == nil)
                .padding(.bottom, 8)
            
            
            Text(post?.author ?? "ํฌ์คํธ ์๊ฐ์๋๋ค.")
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .setSkeletonView(opacity: opacity, shouldShow: post == nil)
                .padding(.bottom, 30)
            
            
            Text(post?.article ?? "์ฝํ ์ฐธ์กฐ์ ๊ฐ์ด ๋ฏธ์์  ์ฐธ์กฐ๋ ์ธ์คํด์ค์ ์ฐธ์กฐ ํ์๋ฅผ ์ฆ๊ฐ์ํค์ง ์์์. ๋ค๋ฅธ ์ ์ ์์ ์ด ์ฐธ์กฐํ๋ ์ธ์คํด์ค๊ฐ ๋ฉ๋ชจ๋ฆฌ์์ ํด์ ๋๋๋ผ๋ ์ค์ค๋ก nil์ ํ ๋นํ์ง ์๋๋ค๋ ์ ์ธ๋ฐ ๊ทธ๋ ๊ธฐ ๋๋ฌธ์, ๋ณ์๋ ํ๋กํผํฐ๋ ์ต์๋์ด๋ ๋ณ์๊ฐ ์๋์ด๋ ๊ฐ๋ฅํด์. ํ์ง๋ง ๋ฉ๋ชจ๋ฆฌ์์ ํด์ ๋ ์ธ์คํด์ค์ ์ ๊ทผํ๋ ค ํ๋ฉด ์๋ชป๋ ์ ๊ทผ์ผ๋ก ์ค๋ฅ๊ฐ ๋ฐ์ํ  ์ ์์ด์โ๏ธ ๋ฐ๋ผ์ ๋ฏธ์์  ์ฐธ์กฐ๋ ์ฐธ์กฐํ๋ ๋์ ๊ทธ ์ธ์คํด์ค๊ฐ ๋ฉ๋ชจ๋ฆฌ์์ ํด์ ๋์ง ์๋๋ค๋ ํ์ธ์ด ์์ ๋๋ง ์ฌ์ฉ ํด์ผํด์๐๐ปโโ๏ธ")
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
    
    // ๋ฐ์ดํฐ ๊ฐฑ์ 
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

### โ๏ธ ์ฃผ์์ 
์ค์ผ๋ ํค์ ์ฝํ์ธ ์ ๋ก๋๋ฅผ ๋ฐฉํดํ๋ฉด์๋จ. ์ค์  ์ฝํ์ธ  ๋ฐ์ดํฐ๊ฐ ๋ก๋๋๋ ์์ ์ด๋๋ฉด ์ฆ์ ์ค์ผ๋ ํค์ ๋์ฒด.
์ค์ผ๋ ํค ๋์์ธ์ ์ ๋๋ฉ์ด์ ์ฌ์ฉ, wave ์ฌ์ฉ์ด ๋ก๋ฉ์๊ฐ์ ์งง๊ฒ ๋๋ผ๊ฒํจ
๋๋ฆฌ๊ณ  ์์ ์ ์ธ ์ ๋๋ฉ์ด์์ ์ฌ์ฉํ๋ ๊ฒ์ด ๋ก๋ฉ์๊ฐ์ ์งง๊ฒ ๋๋ผ๊ฒ ํจ

{ ๋ก๋ฉ ? ์ค์ผ๋ ํค : ์ค์ ์ฝํ์ธ  }

์ค์ผ๋ ํค์ ์ค์  ์ฝํ์ธ ์ ui๋ ๊ทธ๋๋ก ๊ฐ์ ธ์ ์ฌ์ฉ, ๋ฐ์ดํฐ๋ ์์ผ๋ฏ๋ก ๋ค๋ฅธ๋ฐฉ์์ผ๋ก ํํํ ๊ฒ

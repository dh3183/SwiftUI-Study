## ๐ Data Flow
> ๋ณธ ๋ฌธ์๋ WWDC19์ Data Flow Through SwiftUI๋ฅผ ์์ฒญ ํ ์ด๋ฅผ ๊ธฐ๋ฐ์ผ๋ก ์ ๋ฆฌํ ๋ฌธ์์๋๋ค.

* SwiftUI๋ ํ๋ฅญํ ์ฑ์ ๋ง๋๋ ์ต๋จ ๊ฒฝ๋ก์ด์ง๋ง UI์ ๋ณต์ก์ฑ์ ํด๊ฒฐํ๋ค๋ ๋ชฉํ๋ก ์ฒ์๋ถํฐ ์ค๊ณํ์ผ๋ฉฐ ์ด๊ฒ์ <b>์ผ๊ธ ๊ฐ์ฒด(first class citizen)</b>๋ฅผ ์๋ฏธ
* SwiftUI๋ ํญ์ ์ ํํ๊ณ  ์ผ๊ด๋ ๋ฐ์ดํฐ ํํ์ ๋ณด์ฅํ๋๋ก ๋ณด๊ธฐ ๊ณ์ธต์ ์๋ฐ์ดํธํจ

### ๐ฅ 2 Principles
#### ๐ First, every time you read a piece of data in your view, you're creating a dependency for that view.

> _๋ทฐ์์ ๋ฐ์ดํฐ๋ฅผ ์ฝ์ ๋๋ง๋ค, ๋ทฐ์๋ ๋ฐ์ดํฐ์ ๋ํ ์์กด์ด ๋ฐ์ํจ_

<img src="https://user-images.githubusercontent.com/83414134/206924993-63699db1-cfa7-4387-a5c9-b27e60033209.jpg" width="500">

* ํ๋์(PlayerView)์ด ๋ณด๋ผ์(isPlaying)์ ๊ฐ์ ์ฝ์ด์ผ ํ๋ค๊ณ  ํ  ๋, ๋ณด๋ผ์ ๊ฐ์ด ๋ณ๊ฒฝ๋  ๋(True or False)๋ง๋ค View๋ฅผ ์๋ฐ์ดํธ ํด์ผ ํ๋ค.

๊ทธ๋ฌ๋ SwiftUI๋ ์๋ ๋๊ธฐํ ๋๋ ๋ฌดํจํ์ ๊ณผ์ ์ด ์๊ธฐ ๋๋ฌธ์, SwiftUI๋ก ๋ช๊ฐ์ง Tool์ ์ฌ์ฉํ์ฌ ํ๋ ์์ํฌ์ ๋ํ ์์กด์ฑ์ ๊ฐ๋จํ ์ ์ธํ๋ฉด ํ๋ ์์ํฌ๊ฐ ๋๋จธ์ง๋ฅผ ๋ชจ๋ ์ฒ๋ฆฌํ๊ณ , ์ฌ์ฉ์์๊ฒ ์ต์์ ํ๊ฒฝ์ ์ ๊ณตํ๋๋ฐ์ ์ง์คํ  ์ ์๋ค.

#### ๐ Second, that every piece of data that you're reading in your view hierarchy has a source of truth.

> _๋ทฐ์ ๊ณ์ธต์์ ์ฝ์ด๋ค์ด๋ ๋ชจ๋  ๋ฐ์ดํฐ๋ค์ Source of Truth๋ฅผ ๊ฐ์ง๋ค_

<img src="https://user-images.githubusercontent.com/83414134/206925284-50588a70-b740-4759-b923-f22b9ce09218.jpg" width="500">

๋ทฐ์์ ์ฝ๋ ๋ชจ๋  ๋ฐ์ดํฐ๋ค์ ๊ฒฐ๊ตญ ํ๋์ ์์ฒ์ ๊ฐ์ง๋ค๋ ๋ป (Source of Truth)

<img src="https://velog.velcdn.com/images/marisol/post/e41bb7ae-0de8-452a-9866-1c9ad02ae518/image.png" width="500">

์์ ๊ทธ๋ฆผ์์๋ isPlaying์ ๋ฐ์ดํฐ๊ฐ ์กด์ฌํ๋ค. Notification, KV observing, ๊ทธ ์ธ์ ๋ค๋ฅธ ์ด๋ฒคํธ ๋ฑ์ผ๋ก ์๋ตํ๋ ๋ชจ๋  ๋ณต์ก์ฑ์ด ๋ฒ๊ทธ๋ฅผ ์ด๋ป๊ฒ ๋ฐ์์์ผฐ๋์ง ์๊ฐํด๋ณด๋ฉด.. ๐

<img src="https://user-images.githubusercontent.com/83414134/206925934-06fff30f-db49-4f2b-9f85-e0f665732274.jpg" width="500">

์ด๋ฐ ์์ผ๋ก ๋ฐ์ดํฐ๋ฅผ ํ ๊ณณ์ผ๋ก ๋ชจ์ ๋ค์ ๋ ๊ฐ์ ๋ทฐ๊ฐ ๊ทธ๊ฒ์ ์ฐธ์กฐํ๊ฒ ๋ง๋ ๋ค๋ฉด ๋ฐ์ดํฐ ๊ฐ์ inconsistency bug๋ฅผ ์ ๊ฑฐํ  ์ ์์ผ๋ฉฐ ๋ํ, SwiftUI๋ ์ด ๊ตฌ์กฐ๋ฅผ ๊ฐ๋จํ๊ฒ ๋ง๋ค ์ ์๋๋ก ๋์์ค๋ค.

### ๐ฅ Example : Podcast player with SwiftUI
<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FcMwVLv%2FbtqChGZ30N9%2FDG35EPoX86NUeCpHmsvLhk%2Fimg.png" width="500">

ํ์ฌ ์ฝ๋๋ ์๋์ ๊ฐ๋ค.

**PlayerView์ ํ๋กํผํฐ** 
* episode : ํ์ฌ ๋ธ์ถ๋๊ณ  ์๋ ์ํผ์๋(let)
* isPlaying : ํ์ฌ ์ฌ์์ค์ธ์ง์ ์ฌ๋ถ(var)

**body์ VStack**
* Text : episode.title
* Text : episode.showTitle
* Button : isPlaying.toggle

๊ฒ์ผ๋ก ๋ดค์ ๋ ๋ฌธ์ ๊ฐ ์์ด ๋ณด์ด์ง๋ง ์ค์ ๋ก ์ปดํ์ผ ์ ์ฌ์ ๋ฒํผ ์ก์๋ถ์์ ์ค๋ฅ๊ฐ ๋ฐ์ํ๋ค.

<img src="https://user-images.githubusercontent.com/83414134/206926705-b9c738e8-7b53-4e76-8468-82475c7c3579.jpg" width="500">

> _Cannot use mutating member on immutable value: 'self'is immutable_
>
> **๋ถ๋ณ ๊ฐ์์ ๊ฐ๋ณ ๋ฉค๋ฒ๋ฅผ ์ฌ์ฉํ  ์ ์์ต๋๋ค: ํจ์ ํธ์ถ์ ๋ถ๋ณ ๊ฐ์ ๋ฐํํฉ๋๋ค.**

UI๊ฐ ์๋ฐ์ดํธ ๋  ๋ ๋ง๋ค View์ body๊ฐ ๋ฌ๋ผ์ง๋๋ฐ, ์ด๋ฐ ๊ฒฝ์ฐ๋ฅผ ์ฒ๋ฆฌํ๊ธฐ ์ํด <b>@State</b>๋ฅผ ์ฌ์ฉํ๋ค.

<img src="https://user-images.githubusercontent.com/83414134/206927058-629dd13d-9c1f-4db6-bb13-2719fafc5c28.jpg" width="500">

* ๋ด๋ถ ํ๋กํผํฐ์ @State Property Wrapper๋ฅผ ์ ์ฉํด ์์คํ์๊ฒ <b>"์ด ํ๋กํผํฐ(isPlaying)์ ๊ฐ์ ๋ณ๊ฒฝ๋  ์ ์์ผ๋ฉฐ, ์ด ๊ฐ์ ๋ฐ๋ผ Self(PlayerView)์ ์ํ๋ ๋ณ๊ฒฝ๋  ์ ์๋ค"</b>๋ผ๊ณ  ์๋ ค์ค๋ค.
* @State์ธ ๋ณ์์ ๊ฐ์ด ๋ณํ  ๋ View์ ๋ ๋๋ง์ด ๋ฌ๋ผ์ ธ์ผ ํ๋ค๋ ๊ฒ์ SwiftUI๊ฐ ๊ฐ์งํ๋ค.

<img src="https://user-images.githubusercontent.com/83414134/206927241-36fc2b16-871f-4c94-b6a2-ee425da691cd.jpg" width="500">

์์ ๊ตฌ์กฐ์์ isPlaying์ ๊ฐ์ด true๋ก ๋ณํ๋ค๋ฉด

<img src="https://user-images.githubusercontent.com/83414134/206927303-0178ed22-f15d-47d8-b6e1-3ab9e63675b5.jpg" width="500">

##### ๐ Runtime data
* ์ํ๊ฐ ๋ณ๊ฒฝ๋๊ณ  ์ํ๋ฅผ ์์ ํ๋ View์ ์ ํจ์ฑ์ ๊ฒ์ฌํ๊ธฐ ์์
* ์ฆ, ํด๋น View์ ๋ณธ๋ฌธ๊ณผ ๋ชจ๋  ํ์ ํญ๋ชฉ์ด ๋ค์ ๊ณ์ฐ
* ๋ชจ๋  ๋ณ๊ฒฝ์ฌํญ์ ํญ์ View hierarchy๋ฅผ ํตํด ์๋๋ก ์ด๋
* ํ๋ ์์ํฌ๊ฐ ๋ณด๊ธฐ๋ฅผ ๋น๊ตํ๊ณ  ๋ณ๊ฒฝ๋ ๊ฒ๋ง ๋ค์ ๋ ๋๋งํ๊ธฐ ๋๋ฌธ์ ํจ์จ์ 

### ๐ฅ Every @State is a source of truth.
#### ๐ Views are a function of state, not a sequence of events.

View๋ ์ด๋ฒคํธ์ ์ฐ์์ด ์๋๋ผ, ์ํ์ ๊ธฐ๋ฅ์ด๋ค.
๊ธฐ์กด์๋ View ๊ณ์ธต์ ์ง์  ๋ณ๊ฒฝํ์ฌ ์ผ๋ถ ์ด๋ฒคํธ์ ์๋ตํ๋ค. (ํ์ View๋ฅผ ์ถ๊ฐํ๊ฑฐ๋, ์ ๊ฑฐํ๋ ๋ฑ)
SwiftUI๋ View ์ ์ธ์ ์ธ ์ธ์ด๋ก์, ํ์ฌ์ ์ํ๋ฅผ ๊ณ ๋ คํ์ฌ View๋ฅผ ์ค๋ชํ๋ฉฐ app์ user์ device ์ฌ์ด์ ์ง์์ ์ธ ํผ๋๋ฐฑ ๋ฃจํ๋ก ์๊ฐํ  ์ ์๋ค.

<img src="https://user-images.githubusercontent.com/83414134/206927959-1528cf74-9887-41b5-a2cf-69b338afaf13.jpg" width="500">

* ์ ์ ๊ฐ ์ฑ๊ณผ ์ํธ ์์ฉํ์ฌ ์์์ ์์ฑํ๊ณ  ์์์ ํ๋ ์์ํฌ์ ์ํด ์คํ๋๊ณ  ์ผ๋ถ ์ํ๋ฅผ ๋ณํ์ํจ๋ค.
* ์์คํ์ ์ํ๊ฐ ๋ณ๊ฒฝ๋์์์ ๊ฐ์งํ๋ฏ๋ก ์ํ์ ๋ฐ๋ผ ๋ฌ๋ผ์ง๋ View๋ฅผ ์๋ฐ์ดํธํด์ผ ํจ์ ์ ์ ์๋ค.
* ์ด ์๋ฐ์ดํธ๋ ์ ์ ๊ฐ ์ํธ์์ฉํ  ์ ์๋ ์๋ก์ด ๋ฒ์ ์ UI๋ฅผ ์์ฑํ๋ค.

๋ฐ์ดํฐ๊ฐ ํญ์ ๋จ์ผ ๋ฐฉํฅ์ผ๋ก ํ๋ฅด๋ ์ด ๋ชจ๋ธ์, ๋ทฐ ์๋ฐ์ดํธ๋ฅผ ์์ธก ๊ฐ๋ฅํ๊ณ  ์ฝ๊ฒ ์ดํดํ  ์ ์๋ค.
> ์ฌ์ ์ค์ผ ๋์ ์ผ์์ค์ง ์ค์ผ ๋ ํ์ดํ ์์ ๋ค๋ฅด๊ฒ ํ๊ณ  ์ถ๋ค๋ฉด ์ฝ๋๋ฅผ ๊ฐ๋จํ๊ฒ ์ถ๊ฐํ  ์๋ ์์ง๋ง, View์์ ์๋ฏธ์๋ ๋ฐ์ดํฐ๋ฅผ ๋ ์๊ณ  ์ฌ์ฌ์ฉ ๊ฐ๋ฅํ ์์๋ก ๊ทธ๋ฃนํํ  ์ ์๋ค.

<img src="https://user-images.githubusercontent.com/83414134/207125695-369c599d-8ad7-4582-8999-00383d535670.jpg" width="500">

<img src="https://user-images.githubusercontent.com/83414134/207125948-ccb5556a-5d28-471a-bf59-8de527d0bbb4.jpg" width="500">

isPlaying์ ๋ณ์๋ก ์ ์ธํ๋ฉด source of truth๊ฐ ๋ณต์ ๋๊ธฐ ๋๋ฌธ์ ์ด๋ด ๋ ์ฌ์ฉํ๋ Property Wrapper๋ **@Binding** ์ด๋ผ๊ณ  ํ๋ค.

<img src="https://user-images.githubusercontent.com/83414134/207125975-d1f6fb5e-3c3a-452c-8241-6e65a7a039e5.jpg" width="500">

* **@Binding**์ ์ฌ์ฉํด Source of Truth๋ฅผ ์์ฑํ์ง ์๊ณ  ํด๋น ์ฝ๋์ ๋ํ ๋ช์์  ์์กด์ฑ(Explicit Dependency)์ ์ ์ํจ
* **@Binding**์ @State์์ ํ์๋  ์ ์๊ธฐ ๋๋ฌธ์ ์ด๊ธฐ ๊ฐ์ ์ ๊ณตํ  ํ์๊ฐ ์์

<img src="https://user-images.githubusercontent.com/83414134/207130268-8937892b-6bf1-459c-80a5-795228471c06.jpg" width="500">

> _SwiftUI ์ด์ ์ ํด์๋ ๋ฐฉ์_

๊ธฐ์กด์ ๋ฐฉ์์์๋ View Controller์ SubView๋ค์ด ๋์ผํ Property๋ฅผ ๊ฐ๊ฐ ๋ค๊ณ  ์์๋ค. View Controller์ ๋ชฉ์ ์ View์ Data๋ฅผ ๋๊ธฐํ ํด์ผ ํจ
(๋ชจ๋ธ ๋ณํ๋ฅผ ๊ด์ฐฐํ๊ณ  ๊ทธ ์ฌ๊ฑด์ ๋์ํด์ผ ํจ)

์ด๋ฌํ ๋ชจ๋  ๋ณต์ก์ฑ์ SwiftUI์์๋ ๊ทธ๋ ์ง ์๋ค. Data Dependency์ ์ ์ํ๋ ๊ฐ๋จํ ๋๊ตฌ๊ฐ ์์ผ๋ฉฐ ํ๋ ์์ํฌ๊ฐ ๋๋จธ์ง๋ฅผ ๋ชจ๋ ์ฒ๋ฆฌํด View Controller๊ฐ ๋ ์ด์ ํ์ํ์ง ์๋ค.

<img src="https://user-images.githubusercontent.com/83414134/207130278-66051b4b-2151-46ab-b221-f8c5a04a6d53.jpg" width="500">

ํ์ง๋ง **@Binding**์ ํ์ฉํ๋ฉด ์ค์ง ํ๋์ ๋ฐ์ดํฐ๋ง์ ๊ด๋ฆฌํ๋ฉด ๋๋ค.
SwiftUI์์๋ ๋ ์ด์ ๊ทธ๋ฐ ๋ณต์กํ ๊ด๋ฆฌ๋ฅผ ์ผ์ผํ ํ  ํ์๊ฐ ์๋ค. Data Dependency๋ฅผ ์ ์ํด๋๊ธฐ๋ง ํ๋ฉด ํ๋ ์์ํฌ๊ฐ ๋๋จธ์ง๋ฅผ ์์์ ํด์ค ๊ฒ์ด๋ค.

<img src="https://velog.velcdn.com/images/marisol/post/cb8dc8d3-285f-4b0d-b0e2-bcf3cc7ea5af/image.png" width="500">

PlayerView๊ฐ ์ฌ์ ํ source of truth์ธ state๋ฅผ ๊ฐ์ง๊ณ  ์๊ณ , PlayButton์ ํด๋น isPlaying์ $ prefix๋ฅผ ์ฌ์ฉํ์ฌ ๋ฐ์ธ๋ฉํด์ฌ ์ ์๋ค.

#### ๐ The View Controller is no longer required

<img src="https://velog.velcdn.com/images/marisol/post/3637b808-1d27-4bb0-8e12-a80affa03cd3/image.png" width="500">

* Toggle, TextField, Slider ๋ฑ์ ์ด๊ฒ์ ๊ฐ์ ธ๋ค ์ฐ๋ ์ชฝ์์์ Source of truth๋ฅผ ์ ์ง์์ผ ์ฃผ๊ธฐ ์ํด ๋ฐ์ธ๋ฉ์ผ๋ก ๊ตฌํ๋์ด ์๋ค.
* ๋ฐ์ดํฐ๋ฅผ ์์ฑํ ํ, ํด๋น ์ ๋ณด๋ฅผ ๋ณต์ ํ๊ฑฐ๋ ์๋์ผ๋ก ๋๊ธฐํ ํ์ง ์๊ณ , ์ฐธ์กฐ๋ฅผ ์ ๊ณตํ๋ค.

SwiftUI View๋ Layout, Navigation๋ฑ์ ๋ณผ ์ ์๋ ๋ง์ ์ฑ์ด๋ฉฐ ๋จ์ผ ๋ฐ์ดํฐ์ ๋ํ Presentation Logic์ ์บก์ํํ๋ ๋ฐ๋ ์ ์ฉํ๋ค.

<img src="https://velog.velcdn.com/images/marisol/post/1c721054-27fc-42aa-98d5-be54d67d7fed/image.png" width="500">

#### ๐ Working With External Data

<img src="https://user-images.githubusercontent.com/83414134/207138383-7d0e1b6c-8c27-44a8-9e49-c38263c46592.jpg" width="500">

<img src="https://velog.velcdn.com/images/marisol/post/7a76aaf3-4e9a-4c1b-8881-8e15faca5f6f/image.png" width="500">

SwiftUI์์๋ ๋ฐ์ดํฐ ๊ด๋ฆฌ๋ฅผ ์ํ ๋ง์ ๋ฐฉ๋ฒ๋ค์ด ์ ๊ณต๋๋ค. ์ด์ ๋ถํฐ๋ @Environment, @ObservableObject(๋น์ BindableObject)์ ๋ํด ์์๋ณธ๋ค.

SwiftUI์์๋ ์ธ๋ถ ์ด๋ฒคํธ๋ผ๋ ๊ฒฐ๊ตญ์ State์ ๋ณํ๋ก ์ด์ด์ง๋ค. ์์ ์์ ์์ ์ ์ ์ ์ธํฐ๋์์ด ๋ฐ์ํด State๊ฐ ๋ณ๊ฒฝ๋์๋ ๊ฒ๊ณผ ๊ฒฐ๊ณผ์ ์ผ๋ก๋ ๋ณ ์ฐจ์ด๊ฐ ์๋ค.

SwiftUI์์๋ ์ด๋ฐ ์ธ๋ถ ์ด๋ฒคํธ๋ค์ Publisher๋ผ๊ณ  ํต์นญํ๊ณ  Publisher๋ Combine Framework๋ก๋ถํฐ ๋ฐ์๋๋ค.

#### ๐ ์์ ๋ฅผ ํตํด Publisher ์ ์ฉ

<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FWlfv6%2FbtqCrOJVm2W%2FSoV7NkfMkJ1bqVIKkVLNUK%2Fimg.png" width="500">

์ฐ๋ฆฌ์ ๋ชฉ์ ์ SwiftUI์ ํจ๊ป publishers๋ฅผ ์ฌ์ฉํ  ๋ ๊ธฐ์ตํด์ผ ํ  ํ ๊ฐ์ง๊ฐ ์๋ค.
ํ์บ์คํธ ํ๋ ์ด์ด(์์ )์ ํ์์คํฌํ๋ฅผ ์ถ๊ฐํ๋ ์์ ๋ฅผ ํตํด ์ค๋ชํ๋ค.

> ํด๋น ์ธ์์์  Combine์ ๋ํด ์์ธํ ์ค๋ช์ ํ์ง ์์ผ๋ฉฐ ์์ธํ ๋ด์ฉ์ ํ์ธํ๋ ค๋ฉด ๊ด๋ จ ์ธ์์ ํ์ธํด์ผ ํ๋ค๊ณ  ํ๋ค.

@State ๋ณ์์ธ currentTime ์ ์ถ๊ฐํ์๊ณ  body์์ ์ด ๋ณ์๋ฅผ formatter์ ๊ธฐ์ํ๋ค.

<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbyxgMd%2FbtqCwWNzT3H%2Fcm34B5OKEKykRtg2UOEoEK%2Fimg.png" width="500">

VStack ํ๋จ์ onReceive modifire๋ฅผ ์ถ๊ฐํ์๋ค. 
์ด์  ํ์์คํฌํ๊ฐ ๋ณ๊ฒฝ๋๋ฉด onReceive ๋ธ๋ญ ์์์ currentTime ์ด ์๋ก์ด ๊ฐ์ผ๋ก ๋ณ๊ฒฝ๋  ๊ฒ์ด๋ค. currentTime ์ State ๋ณ์์ด๋ค. ๋ฐ๋ผ์ State๊ฐ ๋ณ๊ฒฝ๋ ๊ฒ์ผ๋ก ์ทจ๊ธ๋๊ณ , body ๋ฅผ ํตํด ๋ทฐ์ ๋ ๋๋ง์ด ๋ค์ ์ด๋ฃจ์ด์ง๋ค. ๊ทธ๋ฌ๋ฉด currentTIme ์ ๋ํ UI ๊ฐฑ์ ์ด ์๋์ผ๋ก ์ด๋ฃจ์ด์ง๋ค. ์ด๋ฐ ๊ณผ์ ์ ๊ฑฐ์น๋ ๋์ ์๋์ผ๋ก ์์ฑ๋ ์ฝ๋๋ invalid ์ฒดํฌ ์ฝ๋๋ ํ์ํ์ง ์๋ค๋ ๊ฒ์ด ์ฅ์ ์ด๋ค.

> onReceive ๋ Combine์์ ์ ๊ณตํด์ฃผ๋ ๊ฒ์ผ๋ก, Publisher๊ฐ receive(on:) ๋ฉ์๋๋ฅผ ํตํด ํน์  ํ/์ฐ๋ ๋์์ ๋๋๋ก ์ง์ ํ ๊ฒ์ ์ฌ๊ธฐ์ ๋ฐ์ ์ฒ๋ฆฌํ  ์ ์๊ฒ ๋๋ค. 
>
> ์ ์ฝ๋๋ ํ์ฌ ํ์์คํฌํ๊ฐ ๋ณ๊ฒฝ๋  ๋ fire๋๋ Publisher๊ฐ ๋ฏธ๋ฆฌ ์์ฑ๋์ด ์๋ค๋ ๊ฐ์  ํ์ ์์ฑ๋ ๊ฒ.

### ๐ฅ BindableObject Protocol
<img src="https://velog.velcdn.com/images/marisol/post/3faf8546-c312-407e-9f11-f1e835c07625/image.png">

* BindableObject๋ ์ด๋ฏธ ๊ฐ์ง๊ณ  ์๋, ์ ์บก์ํ๋ ๋ชจ๋ธ์ ์ฌ์ฉํ๋ ํธ๋ฆฌํ ๋ฐฉ๋ฒ์ด๋ค.
* SwiftUI๋ BindableObject Protocol์ ์ ํฉํ๊ฒ ํ๋ ๊ฒ์ด๋ค.

<img src="https://velog.velcdn.com/images/marisol/post/c36ce6e0-9cc4-4359-80cf-21500b1f84ae/image.png">

SwiftUI๋ ๋ฐ์ดํฐ์ ๋ณํ์ ์ด๋ป๊ฒ ๋ฐ์ํด์ผ ํ๋์ง๋ง ์๋ฉด ๋๋ค.
๋ง์ฝ ํ์บ์คํธ(์์ )๊ฐ ๋ชจ๋  ๊ธฐ๊ธฐ์์ ๋๊ธฐํ๋๊ธฐ๋ฅผ ์ํ๋ค๋ฉด Model์ PodcastPlayer View์ ๊ฐ์ ธ์์ผ ํ๋๋ฐ, BindableObject ํ๋กํ ์ฝ์ ์ฑํํ๊ธฐ๋ง ํ๋ฉด ๋๋ค.

<img src="https://velog.velcdn.com/images/marisol/post/9956d35d-b140-4645-9d53-df43d89afd1d/image.png">

<img src="https://user-images.githubusercontent.com/83414134/207144333-1fa8a556-6415-4f61-8732-9923c7aab46b.jpg">

@ObjectBinding property wrapper๋ฅผ ์ฌ์ฉํด dependency์ ์์ฑํ๋ ๋ ๊ฐ๋ฅผ ์ฐ๊ฒฐํ  ์ ์๋ค.
์ด๋ ๊ฒ ํ๋ฉด property wrapper๊ฐ ์๋ ๊ฐ ๋ทฐ๋ ์์ ์์ฑํ ๋ชจ๋ธ์ ๋ฐ๋ผ ๋ฌ๋ผ์ง๋ค.

@State์ ๋ง์ฐฌ๊ฐ์ง๋ก ObjectBinding property wrapper๋ฅผ ์ฌ์ฉํด View์ ์ถ๊ฐํ๋ฉด ํ๋ ์์ํฌ์์ dependency๊ฐ ์์์ ์ธ์ํ๋ค. ๋ฐ์ดํฐ์ ์ ๊ทผํ  ๋ View๋ฅผ ์ธ์  ์๋ฐ์ดํธํ ์ง ์๋์ผ๋ก ์์๋ธ๋ค. View๋ฅผ ์์ฑํ  ๋ ObjectBinding property wrapper๋ฅผ View์ property์ ์ถ๊ฐํ๋ค. ๊ทธ ๋ค์ ์ธ์คํด์คํํ  ๋๋ ์ด๋ฏธ ๊ฐ์ง๊ณ  ์๋ ๋ชจ๋ธ์ ์ฐธ์กฐ๋ฅผ ์ ๋ฌํ๊ธฐ๋ง ํ๋ฉด ๋๋ค. ์ด๊ฒ์ View์ initializer์ Explicit Dependency(๋ช์์  ์์กด์ฑ)์ ์์ฑํ๋ค. ์๋ํ๋ฉด View๋ฅผ ์ธ์คํด์คํํ  ๋ View๊ฐ ๋ชจ๋ธ์ ์์กดํ๋ค๋ ๊ฒ์ ์๊ธฐ ๋๋ฌธ.


#### ๐ Creating Dependencies Indirectly

<img src="https://user-images.githubusercontent.com/83414134/207147222-5f5d63ee-d5ec-4aab-b8a9-b975ac124647.jpg">

ObjectBinding property wrapper๋ฅผ ์ฌ์ฉํด BindableObject๋ฅผ Environment์ ์ธ ์ ์๋ค.
Environment property wrapper๋ฅผ ์ฌ์ฉํด Model์ dependency๋ฅผ ์์ฑํ  ์ ์๋ค. ๊ณ์ธต ์ ์ฒด์ ๋ค์ํ ๋ทฐ์์ ์ด ๋ทฐ๋ฅผ ์ฌ์ฉํ  ์ ์์ผ๋ฉฐ ๋ชจ๋ ๋์ผํ ๋ชจ๋ธ์ ๋ฐ๋ผ ๋ฌ๋ผ์ง๋๋ค. ๋ฌผ๋ก  ๋ฐ์ดํฐ๊ฐ ๋ณ๊ฒฝ๋๋ฉด ๋ชจ๋  ๊ฒ์ด ์๋์ผ๋ก ์๋ฐ์ดํธ๋๋ค.

## ๐ Form
<span>
<img width="198" src="https://user-images.githubusercontent.com/83414134/210690266-9069b902-3dc8-4dab-8aad-fdd95a5e43cc.png">
<img width="206" src="https://user-images.githubusercontent.com/83414134/210690275-43ae57c1-3abb-44dd-bd68-233c506dc1db.png">
<img width="200" src="https://user-images.githubusercontent.com/83414134/210690285-758499cc-90c0-4692-becf-36bdbe7d3334.png">
<img width="200" src="https://user-images.githubusercontent.com/83414134/210690288-75fffb5b-0638-44dd-a88a-2bc482a2cb81.png">
</span>

* settings ํน์ inspectors์ ๊ฐ์ด ๋ฐ์ดํฐ ์๋ ฅ์ ์ฌ์ฉ๋๋ ์ปจํธ๋กค์ ๊ทธ๋ฃนํํ๊ธฐ์ํ ์ปจํ์ด๋๋ค.
* HTML์ Form๊ณผ ์ ์ฌํ๋ค.

### ๐ฅ Form : Declaration
```Swift
struct Form<Content> where Content : View
```

## ๐ Section
* Collection view ๊ณ์ธต์ ์ถ๊ฐํ๋๋ฐ ์ฌ์ฉํ  ์ ์๋ container view๋ค. 
* List, Picker ๋ฐ Form๊ณผ ๊ฐ์ View์์ Section ์ธ์คํด์ค๋ฅผ ์ฌ์ฉํ์ฌ ๋ด์ฉ์ ๋ณ๋์ Section์ผ๋ก ๊ตฌ์ฑํฉ๋๋ค. 
* ๊ฐ Section์๋ ์ฌ์ฉ์๊ฐ ์ธ์คํด์ค๋ณ๋ก ์ ๊ณตํ๋ ์ฌ์ฉ์ ์ ์ ์ฝํ์ธ ๊ฐ ์์ต๋๋ค. 
* ๊ฐ Section์ ๋ํ header ๋ฐ Footer๋ฅผ ์ ๊ณตํ  ์๋ ์์ต๋๋ค.

### ๐ฅ Section : Declaration
```Swift
struct Section<Parent, Content, Footer>
```

> ํด๋น ๋ฌธ์์ ์ด๋ฏธ์ง๋ iOS์ ์ค์  ํ๋ฉด์ Cloneํ์ฌ ๊ตฌํํ๋ค.

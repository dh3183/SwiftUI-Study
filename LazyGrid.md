# LazyGrid
Stack View에 Lazy가 붙은 형태이다.
ScrollView안에 StackView를 사용하는데 뷰를 처음부터 사용 하는 것이 아닐 때, 말 그대로 lazy하게 사용할 때 사용한다.

* iOS 14부터 지원한다.
* LazyGrid는 Vertical과 Horizontal에 따라 나뉜다. <code>LazyVGrid</code> <code>LazyHGrid</code>

## H와 V의 선택지
Item들이 쌓이는 방향에 따라 선택하면 되는데 
- 수평으로 스크롤을 원할 시 <code>LazyHGrid</code>
- 수직으로 스크롤을 원할 시 <code>LazyVGrid</code>

## GridItem
GridItem의 인스턴스들은 <code>LazyVGrid</code>와 <code>LazyHGrid</code>뷰에서 그릴 아이템들의 레이아웃을 설정하는데 사용된다. (VGrid의 경우 columns, HGrid의 경우 rows)

### GridItem의 Size
GridItem의 Size는 총 세 가지 Type이 있다.
- adaptive(LazyVGrid의 경우)<br>
➡️ minimum 값 이상의 Size로 열마다 가능한 많이 아이템들을 배치하고자 할 때 사용되는 사이즈다.
- flexible(LazyVGrid의 경우)<br>
➡️ minimum 값 이상의 사이즈로 column 수를 조절 하고 싶을 때 사용되는 사이즈다. adaptive와 유사하나 열마다 배치되는 아이템 수를 조절할 수 있다는 점에서 다르다.
- fixed(LazyVGrid의 경우)<br> 
➡️ column 수와 크기를 직접 조절하고 싶을 때 사용하는 사이즈다.

# ReferenceKit

`ReferenceKit`은 출처를 손쉽게 관리하기 위한 도구입니다. <br>
`ReferenceKit`은 SwiftUI로 만들었습니다. <br>
`ReferenceKit`저장소에 Issue를 등록하고 언제든지 PR을 보내주새요. 오픈소스에 기여하실 수 있습니다.


## OverView
<p align="center">
<img width="307" alt="HomeView" src="https://user-images.githubusercontent.com/56182112/176992190-943513c6-27bd-4fac-8f3a-d2dba4fe7f3f.png"><img width="307" alt="DetailView" src="https://user-images.githubusercontent.com/56182112/176992199-c33e27b4-b6be-4d10-afbb-f21662d7cccb.png">
</p>

### Supports
* iOS 15.0 or later

## 사용예시

### UIKit

```swift
  let items: [ReferenceItem] = [
    ReferenceItem(title: "ReferenceKit", url: "https://github.com/BoilerSwift/ReferenceKit"),
    ReferenceItem(title: "🐻‍❄️ 만든이", url: "https://rldd.tistory.com"),
    ReferenceItem(title: "ReferenceKit", url: "https://github.com/BoilerSwift/ReferenceKit", deprecated: true),
    ReferenceItem(title: "🐻‍❄️ 만든이", url: "https://rldd.tistory.com", deprecated: true)  
  ]

  let vc = UIHostingController(rootView: ReferenceView(items: items))
  // navigationController?.pushViewController(vc, animated: true)
  vc.modalPresentationStyle = .fullScreen
  self.present(vc, animated: true, completion: nil)
```

### SwiftUI

```swift
  let items: [ReferenceItem] = [
    ReferenceItem(title: "ReferenceKit", url: "https://github.com/BoilerSwift/ReferenceKit"),
    ReferenceItem(title: "🐻‍❄️ 만든이", url: "https://rldd.tistory.com"),
    ReferenceItem(title: "ReferenceKit", url: "https://github.com/BoilerSwift/ReferenceKit", deprecated: true),
    ReferenceItem(title: "🐻‍❄️ 만든이", url: "https://rldd.tistory.com", deprecated: true)  
  ]

  NavigationView {
    ReferenceView(items: items, trailingType: .none)
  }
```

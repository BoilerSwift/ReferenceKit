# ReferenceKit

`ReferenceKit`은 출처를 손쉽게 관리하기 위한 도구입니다. <br>
`ReferenceKit`은 SwiftUI로 만들었습니다. <br>
`ReferenceKit` 레포의 ISSUE를 획인해주세요! 오픈소스에 기여할 수 있습니다

## OverView
<p align="center">
<img width="307" alt="HomeView" src="https://user-images.githubusercontent.com/56182112/176247873-e4aa4834-4383-4e5e-bd4b-7b0038f96ef7.png"><img width="302" alt="DetailView" src="https://user-images.githubusercontent.com/56182112/176248174-a80cb730-2686-4f23-ab0e-87b9e821fc9f.png">
</p>

### Supports
* iOS 15.0 or later

## 사용예시

### UIKit

```swift
  let items: [OpenSourceItem] = [
    OpenSourceItem(title: "ReferenceKit", url: "https://github.com/BoilerSwift/ReferenceKit"),
    OpenSourceItem(title: "🐻‍❄️ 만든이", url: "https://rldd.tistory.com"),
    OpenSourceItem(title: "ReferenceKit", url: "https://github.com/BoilerSwift/ReferenceKit", deprecated: true),
    OpenSourceItem(title: "🐻‍❄️ 만든이", url: "https://rldd.tistory.com", deprecated: true)
  ]

  let vc = UIHostingController(rootView: OpenSourceView(items: items))
  navigationController?.pushViewController(vc, animated: true)
```

### SwiftUI

```swift
  let items: [OpenSourceItem] = [
    OpenSourceItem(title: "ReferenceKit", url: "https://github.com/BoilerSwift/ReferenceKit"),
    OpenSourceItem(title: "🐻‍❄️ 만든이", url: "https://rldd.tistory.com"),
    OpenSourceItem(title: "ReferenceKit", url: "https://github.com/BoilerSwift/ReferenceKit",   deprecated: true),
    OpenSourceItem(title: "🐻‍❄️ 만든이", url: "https://rldd.tistory.com", deprecated: true)
  ]

  NavigationView {
    OpenSourceView(items: items, trailingType: .chevronForward)
  }
```

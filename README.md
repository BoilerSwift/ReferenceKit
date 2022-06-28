# ReferenceKit

`ReferenceKit`은 출처를 손쉽게 관리하기 위한 도구입니다. <br>
`ReferenceKit`은 SwiftUI로 만들었습니다.

## OverView

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

//
//  ViewController.swift
//  ReferenceKitExamples
//
//  Created by Hamlit Jason on 2022/06/20.
//

import UIKit
import ReferenceKit
import SwiftUI

class ViewController: UIViewController {
    
    var button: UIButton = {
        let button = UIButton()
        button.setTitle(
                        """
                        안녕하세요. ReferenceKit에 오신걸 환영합니다.
                        이 문구를 클릭하면 ReferenceKit 예시를 확인하실 수 있습니다.
                        """,
                        for: .normal
        )
        
        return button
    }()
    
    
    let items: [ReferenceItem] = [
        ReferenceItem(title: "ReferenceKit", url: "https://github.com/BoilerSwift/ReferenceKit"),
        ReferenceItem(title: "🐻‍❄️ 만든이", url: "https://rldd.tistory.com"),
        ReferenceItem(title: "ReferenceKit", url: "https://github.com/BoilerSwift/ReferenceKit", deprecated: true),
        ReferenceItem(title: "🐻‍❄️ 만든이", url: "https://rldd.tistory.com", deprecated: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        setupLayout()
        button.addTarget(self, action: #selector(didTapTouch), for: .touchUpInside)
    }
    
    func setupLayout() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @objc
    func didTapTouch() {
        let vc = UIHostingController(rootView: ReferenceView(items: items))
        //        navigationController?.pushViewController(vc, animated: true)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

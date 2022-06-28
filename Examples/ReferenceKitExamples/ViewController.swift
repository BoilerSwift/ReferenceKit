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
        button.setTitle("Go To OpenSourceView", for: .normal)
        
        return button
    }()
    
    
    let items: [OpenSourceItem] = [
        OpenSourceItem(title: "ReferenceKit", url: "https://github.com/BoilerSwift/ReferenceKit"),
        OpenSourceItem(title: "🐻‍❄️ 만든이", url: "https://rldd.tistory.com"),
        OpenSourceItem(title: "ReferenceKit", url: "https://github.com/BoilerSwift/ReferenceKit", deprecated: true),
        OpenSourceItem(title: "🐻‍❄️ 만든이", url: "https://rldd.tistory.com", deprecated: true)
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
            button.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    @objc
    func didTapTouch() {
        let vc = UIHostingController(rootView: OpenSourceView(items: items))
        navigationController?.pushViewController(vc, animated: true)
    }
}

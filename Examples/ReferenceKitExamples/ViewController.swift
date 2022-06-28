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
    
    let button: UIButton {
       let button = UIButton()
        button.setTitle("Go To OpenSourceView", for: .normal)
        return
    }()
    let items: [OpenSourceItem] = [
        OpenSourceItem("https://github.com/BoilerSwift/ReferenceKit"),
        OpenSourceItem("https://github.com/KU-Stacks/kuring-lite-ios", isDeprecated: true),
        OpenSourceItem("https://github.com/KU-Stacks/kuring-sdk-ios-spm", isDeprecated: true),
    ]
    let option: OpenSourceOption = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        setupLayout()
        
    }
    
    func setupLayout() {
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 250),
            button.heightAnchor.constraint(equalToConstant: 100),
            button.centerXAnchor.constraint(equalTo: super.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: super.view.centerYAnchor)
        ])
    }
}

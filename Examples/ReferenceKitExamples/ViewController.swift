//
//  ViewController.swift
//  ReferenceKitExamples
//
//  Created by Hamlit Jason on 2022/06/20.
//

import UIKit
import ReferenceKit

class ViewController: UIViewController {
    
    let items: [OpenSourceItem] = [
        OpenSourceItem("https://github.com/BoilerSwift/ReferenceKit"),
        OpenSourceItem("https://github.com/KU-Stacks/kuring-lite-ios", isDeprecated: true),
        OpenSourceItem("https://github.com/KU-Stacks/kuring-sdk-ios-spm", isDeprecated: true),
    ]
    let option: OpenSourceOption = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = OpenSourceView(items: items, option: option)
    }
}


//
//  LifeCycleController.swift
//  EX_AutoLayout
//
//  Created by 유영웅 on 8/5/24.
//

import Foundation
import UIKit

class LifeCycleController:UIViewController{
    
    var text:UITextView = {
        var text = UITextView()
        text.text = "안녕하세요"
        text.textColor = .black
        text.font = .boldSystemFont(ofSize: 30.0)
        text.textAlignment = .center
        return text
    }()
    
    var button:UIButton = {
        var button = UIButton()
        button.titleLabel?.text = "버튼"
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(text)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            text.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            text.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            text.widthAnchor.constraint(equalToConstant: 200), // 너비
            text.heightAnchor.constraint(equalToConstant: 100) // 높이
        ])
    }
}
#Preview{
    LifeCycleController()
}

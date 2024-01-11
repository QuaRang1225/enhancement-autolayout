//
//  AutoLayoutViewController.swift
//  EX_UIkit
//
//  Created by 유영웅 on 1/11/24.
//

import Foundation
import UIKit

class AutoLayoutViewController:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .system)
        button.setTitle("Push Me", for: .normal)
        button.addTarget(self, action: #selector(buttonPushed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        //leading - leftAnchor
        let leftConstraint = button.leftAnchor.constraint(equalTo: view.leftAnchor)
        leftConstraint.isActive = true
        //trailing - rightAnchor
        let rightConstraint = button.rightAnchor.constraint(equalTo: view.rightAnchor)
        rightConstraint.isActive = true
        let bottomConstraint = button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        bottomConstraint.isActive = true
//        let topConstraint = button.leftAnchor.constraint(equalTo: view.topAnchor)
//        topConstraint.isActive = true
        
    }
    
    @objc func buttonPushed(button:UIButton){
        
    }
}

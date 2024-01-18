//
//  SnapKitViewController.swift
//  EX_AutoLayout
//
//  Created by 유영웅 on 1/18/24.
//

import Foundation
import UIKit

class SnapKitViewController:UIViewController{

    lazy var greenBox:UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints  = false
        return view
    }()
    lazy var redBox:UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints  = false
        return view
    }()
    lazy var yellownBox:UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints  = false
        return view
    }()
    lazy var blueBox:UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints  = false
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(greenBox)
        self.view.addSubview(yellownBox)
        self.view.addSubview(redBox)
        self.view.addSubview(blueBox)
        
        yellownBox.widthAnchor.constraint(equalTo: self.view.widthAnchor,multiplier: 0.9).isActive = true
        yellownBox.heightAnchor.constraint(equalTo: self.view.heightAnchor,multiplier: 0.9).isActive = true
        
        yellownBox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        yellownBox.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}

#Preview{
    SnapKitViewController()
}

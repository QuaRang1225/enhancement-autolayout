//
//  AutoLayoutCode2ViewController.swift
//  EX_AutoLayout
//
//  Created by 유영웅 on 1/19/24.
//

import Foundation
import UIKit

class AutoLayoutCode2ViewController:UIViewController{
    
    
    lazy var moveTopButton:UIButton = {
        let btn = UIButton(type: .system)
        
       
        btn.backgroundColor = .white
        btn.setTitle("위로 올리기", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 30)
        btn.setTitleColor(.black, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 7
        return btn
    }()
    
    var blueView:UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        return view
    }()
    
    var offset:CGFloat = 0
    var blueBoxTopNSLayOutConstraint:NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemYellow
        self.view.addSubview(moveTopButton)
        self.view.addSubview(blueView)
print("dasasd")
        moveTopButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        moveTopButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        moveTopButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 100).isActive = true
        moveTopButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
        blueView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        blueBoxTopNSLayOutConstraint = blueView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,constant: offset)
        blueBoxTopNSLayOutConstraint?.isActive = true
        blueView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        moveTopButton.addTarget(self, action: #selector(moveTop), for: .touchUpInside)
        
        
    }
    @objc func moveTop(sender:UIButton){
        offset -= 40
        blueBoxTopNSLayOutConstraint?.constant = offset
        UIViewPropertyAnimator(duration: 0.2,curve: .easeIn){
            self.view.layoutIfNeeded()
        }.startAnimation()
    }
}

#Preview{
    AutoLayoutCode2ViewController()
}

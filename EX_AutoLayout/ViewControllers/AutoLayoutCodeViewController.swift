//
//  AutoLayoutCodeViewController.swift
//  EX_AutoLayout
//
//  Created by 유영웅 on 1/18/24.
//

import Foundation
import UIKit


class AutoLayoutCodeViewController:UIViewController{
    
    var secondView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        view.layer.cornerRadius = 30
        return view
    }()
    
    var thirdView:MyCircleView = {
        let view = MyCircleView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstView = UIView()
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.backgroundColor = .purple
        firstView.layer.cornerRadius = 30
        self.view.addSubview(firstView)
        
        //x/y축 위치,가로,세로
        firstView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20).isActive = true
        firstView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 200).isActive = true
        
        //뷰의 가로세로 크기제공
        firstView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        firstView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.view.addSubview(secondView)
        
       
        //isActive 삭제 가능
        NSLayoutConstraint.activate([
            secondView.widthAnchor.constraint(equalToConstant: 100),
            secondView.heightAnchor.constraint(equalToConstant: 100),
            secondView.leadingAnchor.constraint(equalTo: firstView.trailingAnchor,constant: 30),
            secondView.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 30)
        ])
        
        self.view.addSubview(thirdView)
        thirdView.widthAnchor.constraint(equalTo: secondView.widthAnchor, multiplier: 1.5).isActive = true
        thirdView.heightAnchor.constraint(equalTo: secondView.heightAnchor, multiplier: 1.5).isActive = true
        thirdView.topAnchor.constraint(equalTo: secondView.bottomAnchor, constant: 50).isActive = true
        thirdView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
    }
}

#Preview{
    AutoLayoutCodeViewController()
}

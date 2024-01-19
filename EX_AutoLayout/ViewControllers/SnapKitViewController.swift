//
//  SnapKitViewController.swift
//  EX_AutoLayout
//
//  Created by 유영웅 on 1/18/24.
//

import Foundation
import UIKit
import SnapKit

class SnapKitViewController:UIViewController{

    lazy var greenBox:UIView = {
        let view = UIView()
        view.backgroundColor = .green
//        view.translatesAutoresizingMaskIntoConstraints  = false
        return view
    }()
    lazy var redBox:UIView = {
        let view = UIView()
        view.backgroundColor = .red
//        view.translatesAutoresizingMaskIntoConstraints  = false
        return view
    }()
    lazy var yellownBox:UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
//        view.translatesAutoresizingMaskIntoConstraints  = false
        return view
    }()
    lazy var blueBox:UIView = {
        let view = UIView()
        view.backgroundColor = .blue
//        view.translatesAutoresizingMaskIntoConstraints  = false
        return view
    }()
    lazy var myButton = { (color:UIColor) -> UIButton in
        let btn = UIButton(type: .system)
        btn.backgroundColor = color
        btn.setTitle("내버튼", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 30)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 16
        return btn
    }
//    var greenBoxTopNSLayOutConstraint:NSLayoutConstraint?
    var greenBoxTopConsrraint:Constraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myDarkGrayBtn = myButton(.darkGray)
        
        
        self.view.addSubview(yellownBox)
        self.view.addSubview(greenBox)
        self.view.addSubview(redBox)
        self.view.addSubview(blueBox)
        self.view.addSubview(myDarkGrayBtn)
        
        
        //기존 오토레이아웃
//        yellownBox.widthAnchor.constraint(equalTo: self.view.widthAnchor,multiplier: 0.9).isActive = true
//        yellownBox.heightAnchor.constraint(equalTo: self.view.heightAnchor,multiplier: 0.9).isActive = true
//        
//        yellownBox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        yellownBox.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        //위와 같은 코드
        yellownBox.snp.makeConstraints { make in
            //아래와 같은 코드
//            make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        }
        
        redBox.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
//            make.center.equalToSuperview()
        }
        blueBox.snp.makeConstraints { make in
            make.width.equalTo(redBox.snp.width).multipliedBy(2)
            make.height.equalTo(redBox.snp.height)
            make.top.equalTo(redBox.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        greenBox.translatesAutoresizingMaskIntoConstraints = false
        
        
        greenBox.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.centerX.equalToSuperview()
            self.greenBoxTopConsrraint = make.top.equalTo(blueBox.snp.bottom).offset(20).constraint
        }
//        greenBoxTopNSLayOutConstraint = greenBox.topAnchor.constraint(equalTo: blueBox.bottomAnchor,constant: 20)
//        greenBoxTopNSLayOutConstraint?.isActive = true
        
        myDarkGrayBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(100)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        myDarkGrayBtn.addTarget(self, action: #selector(moveGreenBoxDown), for: .touchUpInside)
    }
    
    var offset = 0
    @objc fileprivate func moveGreenBoxDown(){
        offset += 40
        print("초록이 내려감\(offset)")
        greenBoxTopConsrraint?.update(offset: offset)
//        greenBoxTopNSLayOutConstraint?.constant = CGFloat(offset)
        UIViewPropertyAnimator(duration: 0.2, curve: .easeIn) {
            self.view.layoutIfNeeded()
        }.startAnimation()
    }
}

#Preview{
    SnapKitViewController()
}

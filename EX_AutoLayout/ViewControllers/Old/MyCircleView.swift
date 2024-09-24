//
//  aaa.swift
//  EX_AutoLayout
//
//  Created by 유영웅 on 1/18/24.
//

import UIKit

class MyCircleView:UIView{
    override func layoutSubviews() {
        super.layoutSubviews()
        print("MyCircleView 호출")
        self.backgroundColor = .yellow
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = self.frame.height/2
    }
}

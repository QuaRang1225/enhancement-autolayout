//
//  CircleButton.swift
//  EX_AutoLayout
//
//  Created by 유영웅 on 1/17/24.
//

import Foundation
import UIKit

//인터페이스 빌더에서 디자인으로 확인 가능하게끔 설정
@IBDesignable
class CircleButton:UIButton{
    
    //인터페이스 빌드의 필드 생성 - 인스펙터 패널에서 사용될수 있도록 설정
    @IBInspectable var cornerRadius:CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
}

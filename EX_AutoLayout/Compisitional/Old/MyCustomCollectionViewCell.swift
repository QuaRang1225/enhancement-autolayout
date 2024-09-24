//
//  MyCustomCollectionViewCell.swift
//  EX_AutoLayout
//
//  Created by 유영웅 on 1/19/24.
//

import Foundation
import UIKit

class MyCustomCollectionViewCell:UICollectionViewCell{
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var profileLabel: UILabel!
    
    var imageName:String = ""{
        didSet{
            //데이터에 따른 셀 ui 변경
            //이미지 설정
            self.profileImage.image = UIImage(systemName: imageName)
            //라벨 설정
            self.profileLabel.text = imageName
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = .green
        self.contentView.layer.cornerRadius = 8
        self.contentView.layer.borderWidth = 1
    }
}

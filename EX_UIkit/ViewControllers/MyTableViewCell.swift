//
//  MyTableViewCell.swift
//  EX_UIkit
//
//  Created by 유영웅 on 1/12/24.
//

import Foundation
import UIKit

class MyTableViewCell:UITableViewCell{
    
    @IBOutlet weak var userProfileImage:UIImageView!
    @IBOutlet weak var userContentLabel: UILabel!
    
    //셀이 렌더링(그릴때) 될때
    override func awakeFromNib() {
        super.awakeFromNib()
        print("MyTableViewCell 불러짐")
        
        //둥글게
        userProfileImage.layer.cornerRadius = userProfileImage.frame.width/2
    }
}

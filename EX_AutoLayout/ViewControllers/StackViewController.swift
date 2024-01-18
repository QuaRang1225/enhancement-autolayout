//
//  StackViewController.swift
//  EX_AutoLayout
//
//  Created by 유영웅 on 1/17/24.
//

import Foundation
import UIKit

class StackViewController:UIViewController{
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet var phoneNumberButtons: [CircleButton]!
    @IBOutlet weak var phoneCallButton: CircleButton!
    
    
    var phoneNumberString = ""{
        didSet{
            DispatchQueue.main.async{ [weak self] in
                self?.phoneNumberLabel.textColor = .black
                self?.phoneNumberLabel.text = self?.phoneNumberString
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for bttnItem in phoneNumberButtons{
            bttnItem.addTarget(self, action: #selector (onNumberBttnClicked), for: .touchUpInside)
        }
        deleteButton.addTarget(self, action: #selector(onDeleteBttnClicked), for: .touchUpInside)
        phoneCallButton.addTarget(self, action: #selector(onCallBttnClicked), for: .touchUpInside)
        
    }
    @objc fileprivate func onNumberBttnClicked(sender:UIButton){
        if sender.imageView?.image == UIImage(systemName: "staroflife.fill"){
            phoneNumberString.append("*")
        }else{
            guard let inputString = sender.titleLabel?.text else {return}
            phoneNumberString.append(inputString)
        }
    }
    @objc fileprivate func onCallBttnClicked(sender:UIButton){
        phoneNumberString.removeAll()
    }
    @objc fileprivate func onDeleteBttnClicked(sender:UIButton){
        phoneNumberString.removeLast()
    }
    
}

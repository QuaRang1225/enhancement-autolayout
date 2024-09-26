//
//  Mission3ViewController.swift
//  EX_AutoLayout
//
//  Created by 유영웅 on 9/26/24.
//

import UIKit

class Mission3ViewController: UIViewController {

    @IBOutlet weak var imagePicker: UIPickerView!
    @IBOutlet weak var imageName: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var imageNames = ["4826","4827","4828"]
    var images:[UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images = imageNames.compactMap{ UIImage(named: "IMG_" + $0) }
        imageName.text = imageNames.first
        image.image = images.first
    }
}


extension Mission3ViewController:UIPickerViewDataSource,UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 150
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: images[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        return imageView
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            imageName.text = imageNames[row]
        }else{
            image.image = images[row]
        }
    }
}

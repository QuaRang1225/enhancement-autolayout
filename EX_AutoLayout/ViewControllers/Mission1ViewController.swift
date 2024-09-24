//
//  Mission1ViewController.swift
//  EX_AutoLayout
//
//  Created by 유영웅 on 9/24/24.
//

import UIKit

class Mission1ViewController: UIViewController {

    var image = 4826
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        imageView.image = UIImage(named: "IMG_\(image)")
    }
    
    @IBAction func nextButton(_ sender: Any) {
         image = image < 4828 ? image + 1 : 4826
        imageView.image = UIImage(named: "IMG_\(image)")
    }
    @IBAction func previousButton(_ sender: Any) {
        image = image > 4826 ? image - 1 : 4828
        imageView.image = UIImage(named: "IMG_\(image)")
    }
}

//
//  ViewController.swift
//  EX_UIkit
//
//  Created by 유영웅 on 2023/07/07.
//

import UIKit

class ViewController: UIViewController {

    var titleLabel:UILabel = {
        let label = UILabel()
        label.text = "HellowWorld"
        label.font = .boldSystemFont(ofSize: 50)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    @IBOutlet weak var helloLabel: UILabel!
    
    //뷰가 생성되었을때
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        view.addSubview(titleLabel)
        view.addSubview(helloLabel)
        // Do any additional setup after loading the view.
        titleLabel.translatesAutoresizingMaskIntoConstraints = false    //위치고정 false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true    //가로세로 중앙에 맞춤
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }


}


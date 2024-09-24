//
//  Mission2ViewController.swift
//  EX_AutoLayout
//
//  Created by 유영웅 on 9/24/24.
//

import UIKit

class Mission2ViewController: UIViewController {

    let selector = #selector(Mission2ViewController.updateTime)
    
    var current:String = ""
    var selecte:String = ""
    
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var selecteTime: UILabel!
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        selecte = formatter(date: sender.date)
        selecteTime.text = "선택시간 : " + selecte
    }
    @objc func updateTime(){
        current = formatter(date: Date())
        currentTime.text =  "현재시간 : " + current
        view.backgroundColor =  current == selecte ? .red : .systemBackground
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: selector, userInfo: nil, repeats: true)
    }
    
    func formatter(date:Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 a HH:mm"
        return formatter.string(from: date)
    }
}

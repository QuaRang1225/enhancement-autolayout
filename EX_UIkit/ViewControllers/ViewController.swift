//
//  ViewController.swift
//  EX_UIkit
//
//  Created by 유영웅 on 2023/07/07.
//

import UIKit

class ViewController: UIViewController {

    
    //버튼 이벤트
    @objc func actionButton(button:UIButton){
        print("눌렀제~")
    }
    
    
    //슬라이드 이벤트
    @IBAction func sliderchanged(_ slider: UISlider) {
        print("슬라이드됨\(slider.value)")
    }
    //스위치 이벤트
    @IBAction func onSwitch(_ switchButton: UISwitch) {
        print(switchButton.isOn ? "스위치 켜짐":"스위치 꺼짐")
    }
    
    //TouchUpInside
    @IBAction func doSomething(_ sender: Any) {
        print("버튼 눌렀다 땜")
    }
    //TouchDown
    @IBAction func touchdown(_ sender: Any) {
        print("버튼 눌림")
    }
    
    @IBOutlet var helloView: UIView!
    @IBOutlet weak var helloLabel: UILabel!
    
    
    var offset:CGPoint?
    //뷰가 생성되었을때
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.addSubview(titleLabel)
        view.addSubview(titleButton)
        view.isUserInteractionEnabled = true
        view.isMultipleTouchEnabled = true
//        view.backgroundColor = .blue
//        view.addSubview(titleLabel)
////        view.addSubview(helloLabel)
//        // Do any additional setup after loading the view.
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false    //위치고정 false
//        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true    //가로세로 중앙에 맞춤
//        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesBegan(touches, with: event)
        
        let touch = touches.first!
        
        //helloLabel버튼 속성중 User Interaction Enable을 선택해야함
        helloLabel.isUserInteractionEnabled = true
        if touch.view == helloLabel{
            let location = touch.location(in: helloLabel)
            offset = location
            return
        }
        offset = nil
        let location = touch.location(in: view)
        print("뷰 터치 시작\(location)")
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesMoved(touches, with: event)
        let touch = touches.first!
        let location = touch.location(in: view)
        
        guard let offset else {return}
        if touch.view == helloLabel{
            //offset값을 빼주지 않으면 터치한 위치가 해당 컴포넌트의 왼쪽 상단에 맞춰지게 됨
            //상단에 고정될 위치에서 터치한 위치를 빼주게 되면 상단으로 이동할 필요없이 터치한 곳으로 부터 부드럽게 움직일 수 있게 보임
            helloLabel.frame.origin.x = location.x - offset.x
            helloLabel.frame.origin.y = location.y - offset.y
        }
        print("뷰 터치 중\(location)")
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("뷰 터치 끝")
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("전화나 홈버튼에 의해 취소됨")
    }


}
extension ViewController{
    
    var titleLabel:UILabel{
        let label = UILabel()
        label.text = "안뇽"
        label.font = .boldSystemFont(ofSize: 50)
        label.textAlignment = .center
        label.textColor = .white
        label.frame = CGRect(x: 20, y: 20, width: 100, height: 100)
        return label
    }
    
    
    var titleButton:UIButton{
        let button = UIButton()
        button.setTitle("눌러바~", for: .normal)
        //하이라이트 모드 눌렀을때
        button.setTitle("눌러짐~", for: .highlighted)
        button.frame = CGRect(x: 80, y: 80, width: 100, height: 100)
        //버튼 이벤트
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        return button
    }
}

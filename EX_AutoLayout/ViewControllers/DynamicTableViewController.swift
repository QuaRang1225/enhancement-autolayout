//
//  DynamicTableViewController.swift
//  EX_UIkit
//
//  Created by 유영웅 on 1/12/24.
//

import Foundation
import UIKit

class DynamicTableViewController:UIViewController{
   
    
    @IBOutlet weak var myTableView: UITableView!
    
    let contentArray = [
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    
    
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //셀 리소스파일 가져오기
//        let myTableViewCellNib = UINib(nibName: "MyTabelViewCell", bundle: <#T##Bundle?#>)
        //NIB - 사용자 인터페이스 요소들을 정의하고 저장하는 파일
        let myTableViewCellNib = UINib(nibName: String(describing: MyTableViewCell.self), bundle: nil)
        //셀에 리소스 등록
        self.myTableView.register(myTableViewCellNib, forCellReuseIdentifier: "myTableViewCell")
        //높이 자동조절
        self.myTableView.rowHeight = UITableView.automaticDimension
        //예상 높이 설정 - 랜더링을 부드럽고 효율적으로 하기 위해
        //셀의 높이가 동적으로 변하는 경우
        self.myTableView.estimatedRowHeight = 120
        
        //아주 중요
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        print("contentArray.count : \(contentArray.count)")
    }
}

//이벤트와 UI코드는 분리해주는게 좋다.
extension DynamicTableViewController:UITableViewDelegate,UITableViewDataSource{
    
    //테이블 뷰 셀의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentArray.count
    }
    
    //각 셀에대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //해당 셀 사용
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as! MyTableViewCell
        
        cell.userContentLabel.text = contentArray[indexPath.row]
//        cell.userProfileImage.layer.cornerRadius = cell.userProfileImage.frame.height / 2
        
        return cell
    }
    
}

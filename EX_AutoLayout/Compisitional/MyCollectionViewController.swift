//
//  MyCollectionViewController.swift
//  EX_AutoLayout
//
//  Created by 유영웅 on 1/19/24.
//

import Foundation
import UIKit

class MyCollectionViewController:UIViewController{
    
//    @IBOutlet weak var mySegmentControll: UISegmentedControl!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var allSFSymbols = [
        "star", "heart", "flag", "person", "book", "bolt", "cloud", "leaf", "bicycle", "car",
        "house", "apple", "sun.max", "moon.stars", "camera", "bell", "note", "mic", "film",
        "hammer", "wrench", "globe", "envelope", "pencil", "paintbrush", "hourglass", "keyboard",
        "printer", "ant", "face.smiling", "face.dashed", "face.grimacing", "arrow.up", "arrow.down",
        "arrow.left", "arrow.right", "arrow.up.circle", "arrow.down.circle", "arrow.left.circle", "arrow.right.circle",
        "arrow.up.square", "arrow.down.square", "arrow.left.square", "arrow.right.square", "arrow.up.and.down",
        "arrow.left.and.right", "arrow.left.and.right.square"
    ]
    
    
     
    @IBAction func onCollectionTypeChanges(_ sender: UISegmentedControl) {
        print("\(sender.selectedSegmentIndex)")
        switch sender.selectedSegmentIndex{
        case 0:
            self.myCollectionView.collectionViewLayout = createCompositionalLayout()
        case 1:
            self.myCollectionView.collectionViewLayout = createCompositionalLayoutSecond()
        case 2:
            self.myCollectionView.collectionViewLayout = createCompositionalLayoutThird()
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //콜렉션뷰 설정
        myCollectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
        //사용할 콜렉션뷰 셀을 등록
        let myCustomCollectionViewCellNib = UINib(nibName: String(describing: MyCustomCollectionViewCell.self), bundle: nil)
        //셀에 리소스 등록
        self.myCollectionView.register(myCustomCollectionViewCellNib, forCellWithReuseIdentifier: String(describing: MyCustomCollectionViewCell.self))
        
        //콜렉션뷰의 콜렉션뷰 레이아웃을 설정
        self.myCollectionView.collectionViewLayout = createCompositionalLayout()
        
        
    }
    //컴포지셔널 레이아웃 설정
    fileprivate func createCompositionalLayout() -> UICollectionViewLayout{
        //컴포지녀설 레이아웃 생성
        let layout = UICollectionViewCompositionalLayout{
            //만들게 되면 튜플의 묶음으로 들어옴 반환하는 것은 NSCollectionLayoutSection콜렉션 레이아웃 섹션을 반환해야함
            (sectionIndex:Int,layoutEnvrionment:NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            //아이템에 대한 사이즈 - absolute는 고정값 ,estimated는 추측,fraction 퍼센트
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            
            //위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1/3)
            //그룹사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            
            //그룹사이즈로 그룹만들기
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item,item,item])
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
            
            //그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
            //continuous - 오른쪽 스크롤,groupPaging - 그룹별로 한번에 스크롤
//            section.orthogonalScrollingBehavior = .continuous
            
            //섹션에 대한 간격 설정
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        return layout
    }
    fileprivate func createCompositionalLayoutSecond() -> UICollectionViewLayout{
        //컴포지녀설 레이아웃 생성
        let layout = UICollectionViewCompositionalLayout{
            //만들게 되면 튜플의 묶음으로 들어옴 반환하는 것은 NSCollectionLayoutSection콜렉션 레이아웃 섹션을 반환해야함
            (sectionIndex:Int,layoutEnvrionment:NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            //아이템에 대한 사이즈 - absolute는 고정값 ,estimated는 추측,fraction 퍼센트
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1.0))
            
            //위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1/3)
            //그룹사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            
            //그룹사이즈로 그룹만들기
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item,item,item])
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
            
            //그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
            //continuous - 오른쪽 스크롤,groupPaging - 그룹별로 한번에 스크롤
//            section.orthogonalScrollingBehavior = .continuous
            
            //섹션에 대한 간격 설정
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        return layout
    }
    fileprivate func createCompositionalLayoutThird() -> UICollectionViewLayout{
        //컴포지녀설 레이아웃 생성
        let layout = UICollectionViewCompositionalLayout{
            //만들게 되면 튜플의 묶음으로 들어옴 반환하는 것은 NSCollectionLayoutSection콜렉션 레이아웃 섹션을 반환해야함
            (sectionIndex:Int,layoutEnvrionment:NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            //아이템에 대한 사이즈 - absolute는 고정값 ,estimated는 추측,fraction 퍼센트
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1.0))
            
            //위에서 만든 아이템 사이즈로 아이템 만들기
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1/3)
            //그룹사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            
            //그룹사이즈로 그룹만들기
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item,item,item])
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 3)
            
            //그룹으로 섹션 만들기
            let section = NSCollectionLayoutSection(group: group)
            //continuous - 오른쪽 스크롤,groupPaging - 그룹별로 한번에 스크롤
//            section.orthogonalScrollingBehavior = .continuous
            
            //섹션에 대한 간격 설정
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        return layout
    }
}

//데이터와 관련된 것둘
extension MyCollectionViewController:UICollectionViewDataSource{
    
    //각 섹션에 들어가는 아이템 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.allSFSymbols.count
    }
    //각 콜렉션뷰 셀에 대한 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MyCollectionViewCell.self), for: indexPath) as! MyCollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MyCustomCollectionViewCell.self), for: indexPath) as! MyCustomCollectionViewCell
        
        cell.imageName = self.allSFSymbols[indexPath.item]
        return cell
    }
    
    
}

//액션과 관련된 것들
extension MyCollectionViewController:UICollectionViewDelegate{
    
}


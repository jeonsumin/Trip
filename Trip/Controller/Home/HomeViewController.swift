//
//  HomeViewController.swift
//  Trip
//
//  Created by Terry on 2022/02/02.
//

import UIKit
import SnapKit

struct Content {
    let sectionType : SectionType
    let title       : String
    let subTitle    : String
    enum SectionType {
        case curation
        case place
        case content
        
    }
}

class HomeViewController: UICollectionViewController {
    
    //MARK: - Properties
    var content: [Content] = []
    //MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        content = [
            Content(sectionType: .curation, title: "title1", subTitle: "subTitle8"),
            Content(sectionType: .curation, title: "title1", subTitle: "subTitle8"),
            Content(sectionType: .curation, title: "title1", subTitle: "subTitle8"),
            Content(sectionType: .curation, title: "title4", subTitle: "subTitle5"),
            Content(sectionType: .curation, title: "title5", subTitle: "subTitle43"),
            Content(sectionType: .place, title: "title2", subTitle: "subTitle7"),
            Content(sectionType: .place, title: "title2", subTitle: "subTitle7"),
            Content(sectionType: .place, title: "title2", subTitle: "subTitle7"),
            Content(sectionType: .place, title: "title3", subTitle: "subTitle6"),
            Content(sectionType: .content, title: "title5", subTitle: "subTitle4"),
            Content(sectionType: .content, title: "title6", subTitle: "subTitle3"),
            Content(sectionType: .content, title: "title7", subTitle: "subTitle2"),
            Content(sectionType: .content, title: "title8", subTitle: "subTitle1"),
        ]
        
        //CollectionView Item(Cell) 설정
        collectionView.register(CurationSectionCollectionViewCell.self, forCellWithReuseIdentifier: "CurationSectionCollectionViewCell")
        //        collectionView.register(PlaseToVisitAroundSectionCollectionViewCell.self, forCellWithReuseIdentifier: "PlaseToVisitAroundSectionCollectionViewCell")
        
        collectionView.collectionViewLayout = layout()
    }
    
    //각각의 섹션타입에 대한 collectionviewLayout 생성
    private func layout() -> UICollectionViewLayout{
        return UICollectionViewCompositionalLayout { [weak self] sectionNumber, environment -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            print("sectionNumber \(self.content[sectionNumber].sectionType)")
            switch self.content[sectionNumber].sectionType {
            case .curation, .place, .content:
                return self.createCurationTypeSection()
            default:
                return nil
            }
        }
    }
    
    private func createCurationTypeSection() -> NSCollectionLayoutSection {
        //item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(0.75))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 10, leading: 5, bottom: 0, trailing: 5)
        
        //group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        
        //section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = .init(top: 0, leading: 5, bottom: 0, trailing: 5)
        
        return section
    }
}

//MARK: - dataSource, Delegate
extension HomeViewController {
    
    //섹션별 셀의 개수
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return content[section].title.count
    }
    
    //셀 설정
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch content[indexPath.section].sectionType {
        case .curation, .content,.place:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurationSectionCollectionViewCell", for: indexPath) as? CurationSectionCollectionViewCell else { return UICollectionViewCell() }
            cell.backgroundColor = .red
            //            cell.setupUI()
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    //섹션의 개수 설정
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return content.count
    }
    
    //셀 선택
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionName = content[indexPath.section].sectionType
        print(" \(sectionName) 섹션의 \(indexPath.row+1)")
    }
}


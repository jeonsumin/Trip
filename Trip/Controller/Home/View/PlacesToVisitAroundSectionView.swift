//
//  placesToVisitAroundSectionView.swift
//  Trip
//
//  Created by Terry on 2022/02/03.
//

import UIKit
import SnapKit
import Kingfisher

class PlacesToVisitAroundSectionView: UIView {
    
    //MARK: - Properties
    private lazy var collectionView :UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = true

        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PlaseToVisitAroundSectionCollectionViewCell.self,  forCellWithReuseIdentifier: "PlaseToVisitAroundSectionCollectionViewCell")
        return collectionView
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .label
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UICollectionViewDataSource
extension PlacesToVisitAroundSectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaseToVisitAroundSectionCollectionViewCell", for: indexPath) as? PlaseToVisitAroundSectionCollectionViewCell
//        cell.backgroundColor = .lightGray
        cell?.setupUI()
        return cell ?? UICollectionViewCell()
        
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension PlacesToVisitAroundSectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2.5
        let height = collectionView.frame.width
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
}

//MARK: - Private Function
private extension PlacesToVisitAroundSectionView {
    func setupUI(){
        [   headerLabel,
            collectionView
        ].forEach{addSubview($0)}
        
        headerLabel.text = "내 주변가볼만한 곳"
        headerLabel.snp.makeConstraints{
            $0.leading.top.equalToSuperview().offset(25)
        }
        let height = collectionView.frame.width
        collectionView.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(25)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.top.equalTo(headerLabel.snp.bottom).offset(5)
//            $0.top.equalToSuperview().inset(16)
            $0.height.equalTo(snp.width)
            
//            $0.leading.equalToSuperview().offset(25)
//            $0.top.equalTo(headerLabel.snp.bottom).offset(5)
//            $0.trailing.equalToSuperview()
//            $0.width.equalToSuperview()
//            $0.height.equalTo(500)
            
        }
    }
}


//
//  curationSectionView.swift
//  Trip
//
//  Created by Terry on 2022/02/03.
//

import UIKit
import SnapKit
import Kingfisher

class CurationSectionView: UIView {
    private lazy var collectioView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        
        collectionView.register(CurationSectionCollectionViewCell.self, forCellWithReuseIdentifier: "CurationSectionCollectionViewCell")
        
        return collectionView
    }()
    
    private lazy var curationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .white
        
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

//MARK: -UICollectionViewDataSource
extension CurationSectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurationSectionCollectionViewCell", for: indexPath) as? CurationSectionCollectionViewCell else { return UICollectionViewCell() }

        cell.setupUI()
        return cell
    }
    
    
}

//MARK: -UICollectionViewDelegateFlowLayout
extension CurationSectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let heigth = collectionView.frame.width * 1.5
        return CGSize(width: width, height: heigth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

private extension CurationSectionView {
    func setupUI() {
        [collectioView,
         curationLabel
        ].forEach{
            addSubview($0)
        }
        
        collectioView.snp.makeConstraints{
            $0.leading.trailing.top.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(snp.width).multipliedBy(1.5)
        }
        
        curationLabel.text = "최근 큐레이션 >"
        curationLabel.snp.makeConstraints{
            $0.trailing.equalTo(collectioView.snp.trailing).inset(12)
            $0.bottom.equalTo(collectioView.snp.bottom).inset(21)
        }
    }
}

//
//  CurationSectionCollectionViewCell.swift
//  Trip
//
//  Created by Terry on 2022/02/03.
//

import UIKit
import SnapKit
import Kingfisher

class CurationSectionCollectionViewCell: UICollectionViewCell {
    private lazy var imageView :UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel :UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()
    
    
    func setupUI(){
        [
            imageView,
            titleLabel,
        ].forEach{addSubview($0)}
        
        
//        let StringURL = URL(string: "https://picsum.photos/3024/4032")
//        imageView.kf.setImage(with: StringURL)
        imageView.backgroundColor = .gray
        
        imageView.snp.makeConstraints{
            $0.leading.top.trailing.bottom.equalToSuperview()
        }
        titleLabel.text = "가족들과 함께 가기 좋은 카페투어 설날 편"
        titleLabel.snp.makeConstraints{
//            $0.leading.equalTo(imageView.snp.leading).inset(20)
//            $0.bottom.equalTo(imageView.snp.bottom).inset(50)
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(400)
            $0.bottom.equalToSuperview().inset(50)
            $0.width.equalTo(175)
            
        }
    }
}

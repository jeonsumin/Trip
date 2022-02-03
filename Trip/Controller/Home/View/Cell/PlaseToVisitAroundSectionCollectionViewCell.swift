//
//  PlaseToVisitAroundSectionCollectionViewCell.swift
//  Trip
//
//  Created by Terry on 2022/02/03.
//

import UIKit
import SnapKit
import Kingfisher

class PlaseToVisitAroundSectionCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView:UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.backgroundColor = .gray
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .label
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .label
        return label
    }()
    
    func setupUI(){
        [imageView,
        titleLabel,
        descriptionLabel].forEach{ addSubview($0) }
        
        let height = contentView.frame.height / 0.5
        
        imageView.snp.makeConstraints{
            $0.leading.top.trailing.equalToSuperview()
//            $0.bottom.equalTo(titleLabel.snp.top).inset(8)
            $0.width.equalToSuperview()
            $0.height.equalTo(320)
//            $0.width.equalTo(snp.height)
        }
        titleLabel.text = "카페이름"
        titleLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(5)
            $0.top.equalTo(imageView.snp.bottom).offset(8)
        }
        descriptionLabel.text = "종로구, 익선동"
        descriptionLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(5)
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
    }
}

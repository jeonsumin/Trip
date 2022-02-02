//
//  HomeViewController.swift
//  Trip
//
//  Created by Terry on 2022/02/02.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    //MARK: - Properties
    private let scrollview = UIScrollView()
    private let contentView = UIView()
    private let stackView = UIStackView()
    
    
    private let curationSectionView = CurationSectionView(frame: .zero)
    private let placesToVisitAroundSectionView = UIView()
    private let locationSectionView = UIView()
    private let contentSectionView = UIView()
    
    
    //MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }


}

//MARK: - Private Function
private extension HomeViewController {
    // UI 세팅
    func setupUI(){
        navigationItem.title = "Trip"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        
        view.addSubview(scrollview)
        scrollview.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        scrollview.addSubview(contentView)
        contentView.snp.makeConstraints{
            $0.edges.width.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        [curationSectionView,
//         placesToVisitAroundSectionView,
//         locationSectionView,
//         contentSectionView
        ].forEach{
//            $0.snp.makeConstraints{
//                $0.height.equalTo(500)
//            }
            stackView.addArrangedSubview($0) }
        
    }
}

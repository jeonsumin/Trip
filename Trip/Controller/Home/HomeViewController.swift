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
    private let tableView = UITableView()
//    private var tableViewHegit = ConstraintItem
    
    private let curationSectionView = CurationSectionView(frame: .zero)
    private let placesToVisitAroundSectionView = PlacesToVisitAroundSectionView(frame: .zero)
    private let locationSectionView = UIView()
//    private let contentSectionView = ContentSectionView(frame: .zero)
    
    
    //MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupUI()
        
    }


}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeViewContentTableViewCell", for: indexPath)
        cell.backgroundColor = .lightGray
        
        return cell
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
        
        scrollview.showsVerticalScrollIndicator = false
        view.addSubview(scrollview)
        scrollview.bounces = false
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
         placesToVisitAroundSectionView,
         tableView
//         locationSectionView,
//         contentSectionView
        ].forEach{
            stackView.addArrangedSubview($0) }
        
        
        tableView.bounces = true
        tableView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(placesToVisitAroundSectionView.snp.bottom).offset(25)
//            $0.height.equalTo(tableView.snp.width)
            $0.height.equalTo(1000)
            
        }
        
    }
    func setupTableView(){
        tableView.dataSource = self
//        tableViewHegit = tableView.heightAnchor
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "HomeViewContentTableViewCell")
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView)
        if scrollview == self.scrollview {
            tableView.isScrollEnabled = (scrollview.contentOffset.y > 600 )
        }
        if scrollview == tableView {
            tableView.isScrollEnabled = (tableView.contentOffset.y > 0 )
        }
    }
}

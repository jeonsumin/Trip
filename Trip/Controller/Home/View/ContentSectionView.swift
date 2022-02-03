//
//  ContentSectionView.swift
//  Trip
//
//  Created by Terry on 2022/02/03.
//

import UIKit
import SnapKit

class ContentSectionView :UIView {
    
    private let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ContentSectionView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentSectionTableViewCell", for: indexPath)
        cell.backgroundColor = .lightGray
        return cell
    }
    
    
}

extension ContentSectionView :UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        500
    }
}

private extension ContentSectionView {
    func setupTableView(){
        tableView.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.isScrollEnabled = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ContentSectionTableViewCell")
    }
    func setupUI(){
        [tableView].forEach{addSubview($0)}
        
        tableView.snp.makeConstraints{
            $0.leading.top.trailing.bottom.equalToSuperview()
            $0.height.equalTo(snp.width)
        }
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI
//struct ViewControllerRepresentable: UIViewControllerRepresentable{
//    func updateUIViewController(_ uiView: UIViewControllerType, context: Context) {
//        //leave this empty
//    }
//    @available(iOS 13.0.0, *)
//    func makeUIViewController(context: Context) -> UIViewController {
//        TodayDetailViewController()
//    }
//}
//@available(iOS 13.0, *)
//struct ViewControllerRepresentable_PreviewProvider: PreviewProvider{
//    static var previews: some View {
//        ViewControllerRepresentable()
//    }
//}
enum DeviceType {
    case iPhoneSE2
    case iPhone8
    case iPhone12Pro
    case iPhone12ProMax
    
    func name() -> String {
        switch self {
        case .iPhoneSE2:
            return "iPhone SE"
        case .iPhone8:
            return "iPhone 8"
        case .iPhone12Pro:
            return "iPhone 12 Pro"
        case .iPhone12ProMax:
            return "iPhone 12 Pro Max"
        }
    }
}

extension UIViewController {
    
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }
    
    func showPreview(_ deviceType: DeviceType = .iPhone12Pro) -> some View {
        Preview(viewController: self).previewDevice(PreviewDevice(rawValue: deviceType.name()))
    }
}

extension UIView {
    private struct Preview: UIViewRepresentable {
        typealias UIViewType = UIView
        
        let view: UIView
        
        func makeUIView(context: Context) -> UIView {
            return view
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {
        }
    }
    
    func showPreview() -> some View {
        Preview(view: self).previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
    }
}

struct ServiceUnavailableViewPreview: PreviewProvider {
    static var previews: some View {
        Group{
            
            ContentSectionView().showPreview()
            
//            {{ViewController}}().showPreview(.iPhone12Pro)
        }
    }
    
}
#endif

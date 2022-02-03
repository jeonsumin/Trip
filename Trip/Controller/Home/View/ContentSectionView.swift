//
//  ContentSectionView.swift
//  Trip
//
//  Created by Terry on 2022/02/03.
//

import UIKit
import SnapKit

class ContentSectionView :UIView {
    
    //MARK: - Properties
    private lazy var collectionView :UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.isScrollEnabled = false
        collectionView.showsHorizontalScrollIndicator = true

        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ContentSectionCollectionViewCell.self,  forCellWithReuseIdentifier: "ContentSectionCollectionViewCell")
        return collectionView
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
extension ContentSectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentSectionCollectionViewCell", for: indexPath)
//            as? ContentSectionCollectionViewCell
        cell.backgroundColor = .lightGray
//        cell?.setupUI()
        return cell
//            ?? UICollectionViewCell()
        
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ContentSectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
}

private extension ContentSectionView {

    func setupUI(){
        [
            collectionView
        ].forEach{addSubview($0)}
        collectionView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
//            $0.top.equalTo(headerLabel.snp.bottom).offset(5)
            $0.top.equalToSuperview().inset(25)
            $0.height.equalTo(snp.width)
            
//            $0.leading.equalToSuperview().offset(25)
//            $0.top.equalTo(headerLabel.snp.bottom).offset(5)
//            $0.trailing.equalToSuperview()
//            $0.width.equalToSuperview()
//            $0.height.equalTo(500)
            
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

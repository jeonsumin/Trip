//
//  LoginViewController.swift
//  Trip
//
//  Created by Terry on 2022/02/02.
//

import UIKit
import SnapKit
import Kingfisher

class LoginViewController: UIViewController {

    //MARK: -Properties
    private lazy var imageView : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .lightGray
        let StringURL = URL(string: "https://picsum.photos/1000/1000")
        img.kf.setImage(with: StringURL)
        
        return img
    }()
    
    private lazy var googleLoginButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("구글로 로그인", for: .normal)
        btn.setImage(UIImage(named: "google.png"), for: .normal)
        btn.backgroundColor = .white
        btn.setTitleColor(.black, for: .normal)
        btn.imageEdgeInsets = .init(top: 7, left: 0, bottom: 7, right: 99)
        btn.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        btn.addTarget(self, action: #selector(TappedGoogleLoginButton), for: .touchUpInside)
        return btn
    }()

    private lazy var appleLoginButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("Apple로 로그인", for: .normal)
        btn.setImage(UIImage(named: "apple.png"), for: .normal)
        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
        btn.imageEdgeInsets = .init(top: 7, left: 0, bottom: 7, right: 99)
        btn.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        btn.addTarget(self, action: #selector(TappedAppleLoginButton), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var termsLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 12, weight: .light)
        lb.text = "로그인함으로써 Terry.Inc의 정책 및 약관에 동의합니다."
        return lb
    }()
    
    //MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

//MARK: -Private Function 
private extension LoginViewController {
    func setupUI(){

        [imageView,
         googleLoginButton,
         appleLoginButton,
         termsLabel
        ].forEach{view.addSubview($0)}
        
        imageView.snp.makeConstraints{
            $0.leading.top.trailing.bottom.equalToSuperview()
        }
        
        googleLoginButton.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.width.equalTo(388)
            $0.height.equalTo(44)
            $0.bottom.equalToSuperview().inset(146)
        }
        appleLoginButton.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(25)
            $0.width.equalTo(388)
            $0.height.equalTo(44)
            $0.top.equalTo(googleLoginButton.snp.bottom).offset(16)
        }
        
        termsLabel.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(75)
            $0.top.equalTo(appleLoginButton.snp.bottom).offset(20)
        }
        
    }
    
    @objc func TappedGoogleLoginButton(){
        //TODO: 구글 로그인 구현
        
//        dismiss(animated: true, completion: nil)
    }
    
    @objc func TappedAppleLoginButton(){
        /*TODO: 애플 로그인 구현해야하지만...추후에 apple Developer 가입 후 구현
                임시로 임의의 값 넣어서 로그인 하는걸로 대체
        */
        
//        dismiss(animated: true, completion: nil)
    }
}

//
//  ViewController.swift
//  SeokBakJi
//
//  Created by 오현민 on 7/16/24.
//

import UIKit
import Then
import SnapKit

class LoginViewController: UIViewController {

    // MARK: - ImageView
    private let symbolImageView = UIImageView().then {
        $0.image = UIImage(named: "symbol")
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Label
    private let titleLabel = UILabel().then {
        let fullText = "로그인 한 번으로\n대학원 생활 시작하기"
        let attributedString = NSMutableAttributedString(string: fullText)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        let rangeText = (fullText as NSString).range(of: "로그인")
        attributedString.addAttribute(.foregroundColor, value: UIColor.orange700, range: rangeText)
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        
        $0.attributedText = attributedString
        $0.textAlignment = .left
        $0.font = UIFont(name: "Pretendard-Bold", size: 26)
        $0.numberOfLines = 0
    }
    
    private let signUpLabel = UILabel().then {
        $0.text = "아직 석박지 계정이 없다면?"
        $0.textAlignment = .center
        $0.textColor = .gray500
        $0.font = UIFont(name: "Pretendard-Regular", size: 12)
        $0.numberOfLines = 0
    }
    
    // MARK: - Button
    private let kakaoLoginButton = UIButton().then {
        $0.setTitle("카카오톡으로 로그인", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 16)
        $0.titleLabel?.textAlignment = .center
        
        $0.setImage(UIImage(named: "Kakao"), for: .normal)
        $0.adjustsImageWhenHighlighted = false
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -150, bottom: 0, right: 0)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        $0.backgroundColor = .kakao
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1.25
        $0.layer.borderColor = UIColor.kakaoBorder.cgColor
    }
    
    private let appleLoginButton = UIButton().then {
        $0.setTitle("Apple로 로그인", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 16)
        $0.titleLabel?.textAlignment = .center
        
        $0.setImage(UIImage(named: "Apple"), for: .normal)
        $0.adjustsImageWhenHighlighted = false
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -185, bottom: 0, right: 0)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        $0.backgroundColor = .black
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1.25
        $0.layer.borderColor = UIColor.black.cgColor
    }
    
    private let emailLoginButton = UIButton().then {
        $0.setTitle("이메일로 로그인", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 16)
        $0.titleLabel?.textAlignment = .center
        
        $0.setImage(UIImage(named: "Mail"), for: .normal)
        $0.adjustsImageWhenHighlighted = false
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -180, bottom: 0, right: 0)
        $0.titleEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        $0.backgroundColor = .white
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1.25
        $0.layer.borderColor = UIColor.gray300.cgColor
        $0.addTarget(self, action: #selector(emailLoginButtonTapped), for: .touchUpInside)
    }
    
    private let signUpButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 12)
        $0.setTitleColor(.gray600, for: .normal)
        $0.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    private let findAccountButton = UIButton().then {
        $0.setTitle("계정 찾기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-Regular", size: 12)
        $0.setTitleColor(.gray600, for: .normal)
        //$0.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
        setupLayout()
        setUpNavigationBar()
    }
    
    // MARK: - navigationBar Title
    private func setUpNavigationBar(){
        self.title = "이메일로 로그인"
    }
    
    override func viewWillAppear(_ animated: Bool) {
      navigationController?.setNavigationBarHidden(true, animated: true) // 뷰 컨트롤러가 나타날 때 숨기기
    }

    override func viewWillDisappear(_ animated: Bool) {
      navigationController?.setNavigationBarHidden(false, animated: true) // 뷰 컨트롤러가 사라질 때 나타내기
    }
    
    // MARK: - Functional
    
    // 회원가입
    @objc private func signUpButtonTapped() {
        // 회원가입 뷰 띄우기
        let signUpVC = SignUpViewController()
        self.navigationController?.pushViewController(signUpVC, animated: true)
        
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    // 이메일로 로그인
    @objc private func emailLoginButtonTapped() {
        let EmailLoginVC = EmailLoginViewController()
        self.navigationController?.pushViewController(EmailLoginVC, animated: true)
        
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .black
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }

    // MARK: - addView
    func setupViews() {
        view.addSubview(symbolImageView)
        view.addSubview(titleLabel)
        view.addSubview(kakaoLoginButton)
        view.addSubview(appleLoginButton)
        view.addSubview(emailLoginButton)
        view.addSubview(signUpLabel)
        view.addSubview(signUpButton)
        view.addSubview(findAccountButton)
    }
    
    // MARK: - setLayout
    func setupLayout() {
        
        symbolImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.top.equalToSuperview().inset(87)
            make.width.height.equalTo(80)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.top.equalTo(symbolImageView.snp.bottom).offset(12)
            make.height.equalTo(80)
        }
        
        kakaoLoginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(appleLoginButton.snp.top).offset(-8)
            make.width.equalTo(342)
            make.height.equalTo(54)
        }
        
        appleLoginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(emailLoginButton.snp.top).offset(-8)
            make.width.equalTo(342)
            make.height.equalTo(54)
        }
        
        emailLoginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(193)
            make.width.equalTo(342)
            make.height.equalTo(54)
        }
        
        signUpLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLoginButton.snp.bottom).offset(71)
            make.leading.equalToSuperview().inset(101)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.centerY.equalTo(signUpLabel)
            make.trailing.equalToSuperview().inset(101)
        }
        
        findAccountButton.snp.makeConstraints { make in
            make.centerX.equalTo(emailLoginButton)
            make.top.equalTo(emailLoginButton.snp.bottom).offset(24)
        }
    }
}

extension LoginViewController: UISheetPresentationControllerDelegate {
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
    
    }
}
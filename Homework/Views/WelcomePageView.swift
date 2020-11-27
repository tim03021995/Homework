//
//  WelcomePageView.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/25.
//

import SnapKit
import UIKit
let screenHeight = UIScreen.main.bounds.height
let screenWidth = UIScreen.main.bounds.width
class WelcomePageView: UIView {
    var logoImageView: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "logoTcbHeader"))
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        return imageView
    }()

    var loginButton: UIButton = {
        var button = Button(buttonStyle: .fill)
        button.setTitle("立即登入", for: .normal)
        button.addTarget(nil, action: #selector(WelcomePageVC.tapLoginButton), for: .touchUpInside)
        return button
    }()

    var googleMapButton: UIButton = {
        var button = Button(buttonStyle: .fill)
        button.setTitle("開啟google地圖", for: .normal)
        button.addTarget(nil, action: #selector(WelcomePageVC.tapGoogleMap), for: .touchUpInside)
        return button
    }()

    var takeImageButton: UIButton = {
        var button = Button(buttonStyle: .fill)
        button.setTitle("拍照", for: .normal)
        button.addTarget(nil, action: #selector(WelcomePageVC.tapTackImage), for: .touchUpInside)
        return button
    }()

    var takeRequest: UIButton = {
        var button = Button(buttonStyle: .fill)
        button.setTitle("Request", for: .normal)
        button.addTarget(nil, action: #selector(WelcomePageVC.tapRequestButton), for: .touchUpInside)
        return button
    }()

    var buttonOutline: UIButton = {
        var button = Button(buttonStyle: .outline)
        button.setTitle("還不是會員？前往註冊", for: .normal)
        button.addTarget(nil, action: #selector(WelcomePageVC.tapSignUpButton), for: .touchUpInside)
        return button
    }()

    lazy var stackView: UIStackView = {
        let subviews = [loginButton, googleMapButton, takeRequest, takeImageButton, buttonOutline]
        var stackView = UIStackView(arrangedSubviews: subviews)
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 6
        stackView.axis = .vertical
        stackView.isUserInteractionEnabled = true
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(logoImageView)
        addSubview(stackView)
        setConstraints()
    }

    func setConstraints() {
        logoImageView.snp.makeConstraints { maker in
            maker.top.equalTo(snp.topMargin).offset(screenHeight * 0.31)
            maker.centerX.equalToSuperview()
//            maker.height.equalTo(screenHeight * 0.12)
            maker.width.equalTo(200)
            maker.height.equalTo(84)
        }
        stackView.snp.makeConstraints { maker in
            maker.top.equalTo(logoImageView.snp.bottom).offset(edgePaddingY)
            maker.leading.equalToSuperview().offset(edgePaddingY)
            maker.trailing.equalToSuperview().offset(-edgePaddingY)
            maker.bottom.equalTo(-100)
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  LoginPageView.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/26.
//

import SnapKit
import UIKit

class LoginPageView: UIView {
    var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "登入"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.isUserInteractionEnabled = true
        return label
    }()

    var signUpButton: Button = {
        var button = Button(buttonStyle: .ghost)
        button.setTitle("註冊", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(nil, action: #selector(LoginPageVC.tapSingUpBtn), for: .touchUpInside)
        return button
    }()

    var midifyPasswordButton: Button = {
        var button = Button(buttonStyle: .ghost)
        button.setTitle("忘記密碼？", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(nil, action: #selector(LoginPageVC.tapforgetPasswordBtn), for: .touchUpInside)
        return button
    }()

    var facebookButton: Imagebutton {
        let button = Imagebutton(buttonStyle: .faceBook)
        button.addTarget(nil, action: #selector(LoginPageVC.tapFacebookBtn), for: .touchUpInside)
        return button
    }

    var googleButton: Imagebutton {
        let button = Imagebutton(buttonStyle: .google)
        button.addTarget(nil, action: #selector(LoginPageVC.tapGoogleBtn), for: .touchUpInside)
        return button
    }

    var appleButton: Imagebutton {
        let button = Imagebutton(buttonStyle: .apple)
        button.addTarget(nil, action: #selector(LoginPageVC.tapAppleBtn), for: .touchUpInside)
        return button
    }

    lazy var iconStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [facebookButton, googleButton, appleButton])
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.isUserInteractionEnabled = true
        return stackView
    }()

    var accountInputBox: InputBox = {
        var inputBox = InputBox()
        inputBox.label.text = "帳號"
        inputBox.textField.placeholder = "帳號"
        inputBox.textField.text = "ccwork"
        return inputBox
    }()

    var passWordInputBox: InputBox = {
        var inputBox = InputBox()
        inputBox.label.text = "密碼"
        inputBox.textField.placeholder = "密碼"
        inputBox.textField.text = "ccwork"
        inputBox.textField.eyesButton.isHidden = false
        inputBox.textField.isSecureTextEntry = true
        inputBox.textField.eyesButton.addTarget(nil, action: #selector(LoginPageVC.tapPasswordEyeBtn), for: .touchUpInside)
        return inputBox
    }()

    var separatorView: UIView = {
        var separatorView = UIView()
        var separator = UIView()
        var label = UILabel()
        separator.backgroundColor = .subtext2Color
        label.text = "或"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .subtext2Color
        label.backgroundColor = .white
        separatorView.addSubview(separator)
        separatorView.addSubview(label)
        separator.snp.makeConstraints { maker in
            maker.leading.trailing.equalToSuperview()
            maker.centerY.equalToSuperview()
            maker.height.equalTo(1)
        }
        label.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
            maker.width.equalTo(46)
            maker.height.equalToSuperview()
        }
        return separatorView
    }()

    var checkBox: CheckBox = {
        var checkBox = CheckBox()
        checkBox.button.addTarget(self, action: #selector(LoginPageVC.tapCheckBox), for: .touchUpInside)
        checkBox.button.isSelected = false
        return checkBox
    }()

    var loginButton: UIButton = {
        var button = Button(buttonStyle: .fill)
        button.setTitle("登入", for: .normal)
        button.addTarget(nil, action: #selector(LoginPageVC.taploginBtn), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .customBackgroundColor
        addSubview(titleLabel)
        titleLabel.addSubview(signUpButton)
        addSubview(iconStackView)
        addSubview(separatorView)
        addSubview(accountInputBox)
        addSubview(passWordInputBox)
        addSubview(checkBox)
        addSubview(loginButton)
        addSubview(midifyPasswordButton)
        setConstraints()
    }

    func setConstraints() {
        titleLabel.snp.makeConstraints { maker in
            maker.top.equalTo(snp.topMargin).offset(edgePaddingY)
            maker.leading.equalTo(edgePaddingX)
            maker.trailing.equalTo(-edgePaddingX)
            maker.height.equalTo(35)
        }
        signUpButton.snp.makeConstraints { maker in
            maker.trailing.bottom.equalToSuperview()
            maker.height.equalTo(22)
            maker.width.equalTo(32)
        }
        iconStackView.snp.makeConstraints { maker in
            maker.top.equalTo(titleLabel.snp.bottom).offset(36)
            maker.leading.equalTo(edgePaddingX)
            maker.trailing.equalTo(-edgePaddingX)
            maker.height.equalTo(36)
        }
        separatorView.snp.makeConstraints { maker in
            maker.top.equalTo(iconStackView.snp.bottom).offset(edgePaddingY)
            maker.leading.equalTo(edgePaddingX)
            maker.trailing.equalTo(-edgePaddingX)
            maker.height.equalTo(20)
        }
        accountInputBox.snp.makeConstraints { maker in
            maker.top.equalTo(separatorView.snp.bottom).offset(edgePaddingY)
            maker.leading.equalTo(edgePaddingX)
            maker.trailing.equalTo(-edgePaddingX)
        }
        passWordInputBox.snp.makeConstraints { maker in
            maker.top.equalTo(accountInputBox.snp.bottom).offset(edgePaddingY)
            maker.leading.equalTo(edgePaddingX)
            maker.trailing.equalTo(-edgePaddingX)
        }
        checkBox.snp.makeConstraints { maker in
            maker.top.equalTo(passWordInputBox.snp.bottom).offset(edgePaddingY)
            maker.leading.equalToSuperview().offset(edgePaddingY)
        }
        midifyPasswordButton.snp.makeConstraints { maker in
            maker.top.bottom.equalTo(checkBox)
            maker.trailing.equalTo(-edgePaddingX)
        }
        loginButton.snp.makeConstraints { maker in
            maker.top.equalTo(checkBox.snp.bottom).offset(60)
            maker.leading.equalTo(edgePaddingX)
            maker.trailing.equalTo(-edgePaddingX)
        }
    }

    func getAccount() -> String {
        return accountInputBox.textField.text ?? ""
    }

    func getPassword() -> String {
        return passWordInputBox.textField.text ?? ""
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  MidifyPasswordView.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/25.
//

import SnapKit
import UIKit

class MidifyPasswordView: UIView {
    var someBool = false
    var heightConstraint: Constraint?

    var newPassword: InputBox = {
        var inputBox = InputBox()
        inputBox.label.text = "新密碼"
        inputBox.textField.placeholder = "新密碼"
        inputBox.textField.eyesButton.isHidden = false
        inputBox.textField.isSecureTextEntry = true
        inputBox.textField.eyesButton.addTarget(self, action: #selector(MidifyPasswordVC.tapPasswordEyeBtn), for: .touchUpInside)
        return inputBox
    }()

    var confirmPassword: InputBox = {
        var inputBox = InputBox()
        inputBox.label.text = "確認密碼"
        inputBox.textField.placeholder = "再次輸入新密碼"
        inputBox.textField.eyesButton.isHidden = false
        inputBox.textField.isSecureTextEntry = true
        inputBox.textField.eyesButton.addTarget(self, action: #selector(MidifyPasswordVC.tapConfirmPasswordBtn), for: .touchUpInside)
        return inputBox
    }()

    var buttonFill: UIButton = {
        var button = Button(buttonStyle: .fill)
        button.setTitle("確認修改", for: .normal)
        button.addTarget(nil, action: #selector(WelcomePageVC.tapLoginButton), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(newPassword)
        addSubview(confirmPassword)
        addSubview(buttonFill)
        setConstraints()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setConstraints() {
        newPassword.snp.makeConstraints { maker in
            maker.top.equalTo(snp.topMargin).offset(100)
            maker.leading.equalTo(16)
            maker.trailing.equalTo(-16)
        }
        confirmPassword.snp.makeConstraints { maker in
            maker.top.equalTo(newPassword.snp.bottom).offset(10)
            maker.leading.equalTo(16)
            maker.trailing.equalTo(-16)
        }
        buttonFill.snp.makeConstraints { maker in
            maker.top.equalTo(confirmPassword.snp.bottom).offset(60)
            maker.leading.equalTo(16)
            maker.trailing.equalTo(-16)
        }
    }

//    override func touchesBegan(_: Set<UITouch>, with _: UIEvent?) {
//        someBool.toggle()
//        heightConstraint?.deactivate()
//        inputBox.label.snp.makeConstraints { maker in
//            let height = someBool ? 44 : 200
//            self.heightConstraint = maker.height.equalTo(height).constraint
//        }
//        inputBox.label.backgroundColor = .gray
//        UIView.animate(withDuration: 1) {
//            self.inputBox.layoutIfNeeded()
//        }
//    }
}

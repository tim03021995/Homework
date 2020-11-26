//
//  LoginPageVC.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/26.
//

import UIKit

class LoginPageVC: UIViewController {
    var loginPageView = LoginPageView()
    override func loadView() {
        view = loginPageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @objc func tapFacebookBtn() {
        print(#function)
    }

    @objc func tapGoogleBtn() {
        print(#function)
    }

    @objc func tapAppleBtn() {
        print(#function)
    }

    @objc func tapSingUpBtn() {
        print(#function)
    }

    @objc func tapCheckBox() {
        print(#function)
        loginPageView.checkBox.button.isSelected = !loginPageView.checkBox.button.isSelected
    }

    @objc func tapforgetPasswordBtn() {
        print(#function)
    }

    @objc func tapPasswordEyeBtn() {
        loginPageView.passWordInputBox.textField.isSecureTextEntry = !loginPageView.passWordInputBox.textField.isSecureTextEntry
        loginPageView.passWordInputBox.textField.eyesButton.isSelected = !loginPageView.passWordInputBox.textField.eyesButton.isSelected
    }

    @objc func taploginBtn() {
        print(#function)
    }
}

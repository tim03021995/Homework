//
//  LoginPageVC.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/26.
//

import UIKit

class LoginPageVC: UIViewController {
    var loginPageView = LoginPageView()
    var loginPageModel = LoginPageModel()
    override func loadView() {
        view = loginPageView
        loginPageModel.getToken { success in
            if success {
                print("getToken!!")
            }
        }
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
        let account = loginPageView.getAccount()
        let password = loginPageView.getPassword()
        loginPageModel.memberLogin(account: account, password: password) { [self] succes in
            switch succes {
            case true:
                print("loginSuccess")
                getMemberData()
            case false:
                print("loginFail")
                loginPageView.wrongLogin(text: "帳號或密碼錯誤")
            }
        }
        print(#function)
    }

    func getMemberData() {
        print(#function)
        loginPageModel.getMemberData { (res: Result<MemberDataModel, NetworkError>) in
            switch res {
            case let .success(data):
                if data.success {
                    let vc = MemberDataVC()
                    vc.memberData = data.member
                    self.show(vc, sender: nil)
                } else {
                    print(data.message)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}

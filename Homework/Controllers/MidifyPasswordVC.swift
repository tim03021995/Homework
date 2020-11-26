//
//  MidifyPasswordVC.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/25.
//

import UIKit

class MidifyPasswordVC: UIViewController {
    let midifyPasswordView = MidifyPasswordView()
    override func loadView() {
        view = midifyPasswordView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc func tapPasswordEyeBtn() {
        midifyPasswordView.newPassword.textField.isSecureTextEntry = !midifyPasswordView.newPassword.textField.isSecureTextEntry
        midifyPasswordView.newPassword.textField.eyesButton.isSelected = !midifyPasswordView.newPassword.textField.eyesButton.isSelected
    }

    @objc func tapConfirmPasswordBtn() {
        midifyPasswordView.confirmPassword.textField.isSecureTextEntry = !midifyPasswordView.confirmPassword.textField.isSecureTextEntry
        midifyPasswordView.confirmPassword.textField.eyesButton.isSelected = !midifyPasswordView.confirmPassword.textField.eyesButton.isSelected
    }
}

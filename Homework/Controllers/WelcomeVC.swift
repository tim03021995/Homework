//
//  ContentView.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/24.
//
import UIKit

class WelcomePageVC: UIViewController {
    let welcomePageView = WelcomePageView()
    override func loadView() {
        view = welcomePageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc func tapLoginButton() {
        print(#function)
        let vc = LoginPageVC()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }

    @objc func tapSignUpButton() {
        print(#function)
    }

    @objc func tapGoogleMap() {
        print(#function)
    }

    @objc func tapTackImage() {
        print(#function)
    }
}

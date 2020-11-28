//
//  RequestTestPageVC.swift
//  Homework
//
//  Created by goodideas-studio on 2020/11/27.
//

import UIKit

class RequestTestPage2VC: UIViewController {
    var loginPageModel = LoginPageModel()

    var requestTestPageView = RequestTestPageView()
    override func loadView() {
        view = requestTestPageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//
//  RequestTestPageVC.swift
//  Homework
//
//  Created by goodideas-studio on 2020/11/27.
//

import UIKit

class RequestTestPage2VC: UIViewController {
    var requestTestPageView = RequestTestPageView()
    override func loadView() {
        view = requestTestPageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        HTTPRequest(method: .GET, host: .demo, pathType: .demo(endPoint: .appexam1)).request { (res: Result<Account, NetworkError>) in
            switch res {
            case let .success(aa):
                print(aa)
            case let .failure(bb):
                print(bb)
            }
        }
    }
}

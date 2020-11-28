//
//  MemberDataVC.swift
//  Homework
//
//  Created by goodideas-studio on 2020/11/28.
//

import UIKit

class MemberDataVC: UIViewController {
    let memberDataView = MemberDataView()
    var memberData: Member!
    override func loadView() {
        view = memberDataView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_: Bool) {
        super.viewWillAppear(true)
        memberDataView.setViewData(memberData: memberData)
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}

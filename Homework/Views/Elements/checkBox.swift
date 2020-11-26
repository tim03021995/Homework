//
//  checkBox.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/26.
//

import SnapKit
import UIKit

class CheckBox: UIView {
    var button: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "checkbox"), for: .normal)
        button.setImage(UIImage(named: "checkboxChecked"), for: .selected)
        return button
    }()

    var label: UILabel = {
        var label = UILabel()
        label.text = "記住我"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
        addSubview(label)
        addSubview(button)
        button.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.centerY.equalToSuperview()
            maker.height.width.equalTo(18)
        }
        label.snp.makeConstraints { maker in
            maker.leading.equalTo(button.snp.trailing).offset(8)
            maker.centerY.equalTo(button)
            maker.width.equalTo(62)
            maker.height.equalTo(20)
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

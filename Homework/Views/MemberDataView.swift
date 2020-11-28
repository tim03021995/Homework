//
//  MemberDataView.swift
//  Homework
//
//  Created by goodideas-studio on 2020/11/28.
//

import Kingfisher
import SnapKit
import UIKit

class MemberDataView: UIView {
    lazy var photo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    lazy var id: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor.textColor
        label.backgroundColor = UIColor.clear
        return label
    }()

    lazy var account: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.textColor
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        return label
    }()

    lazy var name: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = UIColor.textColor
        label.backgroundColor = UIColor.clear

        return label
    }()

    lazy var address: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.textColor
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        return label
    }()

    lazy var phone: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.textColor
        label.backgroundColor = UIColor.clear
        return label
    }()

    lazy var VStack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [name, account, address, phone, id])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.spacing = 6
        return stack
    }()

    lazy var HStack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [photo, VStack])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 6
        stack.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
        stack.layer.cornerRadius = 25
        stack.clipsToBounds = true
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        addSubview(HStack)
        setConstraints()
    }

    private func setConstraints() {
        HStack.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
            maker.width.equalTo(350)
            maker.height.equalTo(250)
        }
    }

    func setViewData(memberData: Member) {
        let imageURL = URL(string: memberData.photo)
        photo.kf.setImage(with: imageURL)
        id.text = "ID: " + String(memberData.id)
        account.text = "Account: " + memberData.account
        name.text = memberData.name
        address.text = "Address: " + memberData.address
        phone.text = "Phone: " + memberData.phone
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

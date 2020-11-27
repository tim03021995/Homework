//
//  Cell.swift
//  RedSo
//
//  Created by Alvin Tseng on 2020/11/11.
//

import UIKit

class CourseCell: UITableViewCell {
    lazy var IDLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 90)
        label.textColor = UIColor.textColor
        label.backgroundColor = UIColor.clear
        label.adjustsFontSizeToFitWidth = true

        return label
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = UIColor.textColor
        label.backgroundColor = UIColor.clear
        return label
    }()

    lazy var attackLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = UIColor.textColor
        label.backgroundColor = UIColor.clear
        return label
    }()

    lazy var defenseLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = UIColor.textColor
        label.backgroundColor = UIColor.clear
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.clear
        setConstraints()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setView(resultCell: Account) {
        IDLabel.text = resultCell.id
        nameLabel.text = resultCell.name
        attackLabel.text = "Attack: " + String(resultCell.attack)
        defenseLabel.text = "Defense: " + String(resultCell.defense)
    }

    private func setConstraints() {
        addSubview(IDLabel)
        addSubview(nameLabel)
        addSubview(attackLabel)
        addSubview(defenseLabel)

        IDLabel.snp.makeConstraints { make in
            make.height.width.equalTo(100)
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-10)
        }
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(IDLabel.snp.right).offset(20)
            make.top.right.equalToSuperview().offset(20)
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        attackLabel.snp.makeConstraints { make in
            make.left.equalTo(IDLabel.snp.right).offset(20)
            make.top.equalTo(nameLabel.snp.bottom)
            make.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        defenseLabel.snp.makeConstraints { make in
            make.left.equalTo(IDLabel.snp.right).offset(20)
            make.top.equalTo(attackLabel.snp.bottom)
            make.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)
        }
    }
}

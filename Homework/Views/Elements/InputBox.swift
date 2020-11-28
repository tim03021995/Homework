//
//  InputBox.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/25.
//

import SnapKit
import UIKit

class InputBox: UIView {
    let spaceY = screenHeight * 0.0089
    var label: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    lazy var textField: CustomTextField = {
        var textfield = CustomTextField()
        textfield.addSubview(separator)
        return textfield
    }()

    var promptLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [label, textField, promptLabel])
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.distribution = .equalCentering
        stackView.alignment = .fill
        stackView.isUserInteractionEnabled = true
        return stackView
    }()

    var separator: UIView = {
        let separator = UIView()
        return separator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
        setStatus(status: .normal)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setConstraints() {
        addSubview(stackView)
        stackView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        textField.snp.makeConstraints { maker in
            maker.height.equalTo(36)
        }
        separator.snp.makeConstraints { maker in
            maker.leading.trailing.bottom.equalToSuperview()
            maker.height.equalTo(1)
        }
    }

    func setStatus(status: Status) {
        switch status {
        case .normal:
            label.textColor = .titleColor
            textField.backgroundColor = .spaceColor
            promptLabel.textColor = .titleColor
            separator.backgroundColor = .titleColor
        case .highlight:
            label.textColor = .mainColor
            textField.backgroundColor = .spaceColor
            promptLabel.textColor = .mainColor
            separator.backgroundColor = .mainColor
        case .waring:
            label.textColor = .warningColor
            textField.backgroundColor = .spaceColor
            promptLabel.textColor = .warningColor
            separator.backgroundColor = .warningColor
        }
    }

    enum Status {
        case normal, highlight, waring
    }
}

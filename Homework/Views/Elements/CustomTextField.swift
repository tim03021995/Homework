//
//  CustomTextField.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/26.
//

import UIKit
class CustomTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        rightView = buttonStackView
        rightViewMode = .always
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var eyesButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "inputboxPasswordShow"), for: .normal)
        button.setImage(UIImage(named: "inputboxPasswordHide"), for: .selected)
        button.isHidden = true

        return button
    }()

    var warningButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "iconCircleExclamation"), for: .normal)
        button.isHidden = true

        return button
    }()

    var correctButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "iconCircleCheck"), for: .normal)
        button.isHidden = true
        return button
    }()

    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [correctButton, warningButton, eyesButton])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()

    enum Constants {
        static let sidePadding: CGFloat = 15
        static let topPadding: CGFloat = 0
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(
            x: bounds.origin.x + Constants.sidePadding,
            y: bounds.origin.y + Constants.topPadding,
            width: bounds.size.width - Constants.sidePadding * 2,
            height: bounds.size.height - Constants.topPadding * 2
        )
    }

    override func rightViewRect(forBounds _: CGRect) -> CGRect {
        let width = getButtonStackViewWidth()
        let cgrect = CGRect(x: frame.width - width - 6, y: 0, width: width, height: frame.height)
        return cgrect
    }

    func getButtonStackViewWidth() -> CGFloat {
        var width: CGFloat = 6
        for item in buttonStackView.arrangedSubviews {
            if let button = item as? UIButton {
                if button.isHidden == false {
                    width += (button.image(for: .normal)?.size.width) ?? 0
                    width += 6
                }
            }
        }
        return width
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
}

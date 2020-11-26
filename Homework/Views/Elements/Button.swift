//
//  Button.swift
//  TaiwanComic
//
//  Created by goodideas-studio on 2020/11/24.
//

import DynamicColor
import UIKit

class Button: UIButton {
    override var isHighlighted: Bool {
        didSet {
            isHighlightSet()
        }
    }

    override var isEnabled: Bool {
        didSet {
            isDisableSet()
        }
    }

    var isHighlightSet: () -> Void = {}
    var isDisableSet: () -> Void = {}
    convenience init(buttonStyle: ButtonStyle) {
        self.init()
        titleLabel?.adjustsFontSizeToFitWidth = true
        switch buttonStyle {
        case .fill:
            backgroundColor = .mainColor
            layer.borderColor = UIColor.mainColor.cgColor
            setTitleColor(.white, for: .normal)
            setTitleColor(.white, for: .selected)
            setTitleColor(.subtextColor, for: .disabled)
            isHighlightSet = {
                self.backgroundColor = self.isHighlighted ? .mainlightColor : .mainColor
                self.layer.borderColor = self.isHighlighted ? UIColor.mainColor.cgColor : UIColor.mainColor.cgColor
            }
            isDisableSet = {
                self.backgroundColor = self.isEnabled ? .mainColor : .pressColor
                self.layer.borderColor = self.isEnabled ? UIColor.mainColor.cgColor : UIColor.pressColor.cgColor
            }
        case .outline:
            backgroundColor = .clear
            layer.borderWidth = 1
            layer.borderColor = UIColor.mainColor.cgColor
            setTitleColor(.mainColor, for: .normal)
            setTitleColor(.mainColor, for: .highlighted)
            setTitleColor(.subtextColor, for: .disabled)
            isHighlightSet = {
                self.backgroundColor = self.isHighlighted ? .mainlightColor : .clear
                self.layer.borderColor = self.isHighlighted ? UIColor.mainlightColor.cgColor : UIColor.mainColor.cgColor
            }
            isDisableSet = {
                self.backgroundColor = self.isEnabled ? .clear : .pressColor
                self.layer.borderColor = self.isEnabled ? UIColor.mainColor.cgColor : UIColor.pressColor.cgColor
            }
        case .outline2:
            backgroundColor = .clear
            layer.borderWidth = 1
            layer.borderColor = UIColor.textColor.cgColor
            setTitleColor(.textColor, for: .normal)
            setTitleColor(.textColor, for: .highlighted)
            setTitleColor(.subtextColor, for: .disabled)
            isHighlightSet = {
                self.backgroundColor = self.isHighlighted ? .pressColor : .clear
                self.layer.borderColor = self.isHighlighted ? UIColor.textColor.cgColor : UIColor.textColor.cgColor
            }
            isDisableSet = {
                self.backgroundColor = self.isEnabled ?.clear : .pressColor
                self.layer.borderColor = self.isEnabled ? UIColor.textColor.cgColor : UIColor.pressColor.cgColor
            }
        case .ghost:
            backgroundColor = .clear
            setTitleColor(.mainColor, for: .normal)
            setTitleColor(.mainColor, for: .highlighted)
            isHighlightSet = {
                self.backgroundColor = self.isHighlighted ? .pressColor : .clear
            }
            isDisableSet = {}
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    enum ButtonStyle {
        case fill
        case outline
        case outline2
        case ghost
    }
}

class Imagebutton: UIButton {
    override var isHighlighted: Bool {
        didSet {
            isSelectedSet()
        }
    }

    var isSelectedSet: () -> Void = {}
    convenience init(buttonStyle: ButtonStyle) {
        self.init()
        backgroundColor = .clear
        layer.borderWidth = 1
        layer.borderColor = UIColor.subtextColor.cgColor
        switch buttonStyle {
        case .faceBook:
            setImage(UIImage(named: "snsColorFb"), for: .normal)
        case .google:
            setImage(UIImage(named: "snsColorGoogle"), for: .normal)
        case .apple:
            setImage(UIImage(named: "snsColorApple"), for: .normal)
        }
        isSelectedSet = {
            self.backgroundColor = self.isHighlighted ? .pressColor : .clear
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    enum ButtonStyle {
        case faceBook, google, apple
    }
}

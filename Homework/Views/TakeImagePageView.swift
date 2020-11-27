//
//  TakeImagePageView.swift
//  Homework
//
//  Created by goodideas-studio on 2020/11/26.
//

import SnapKit
import UIKit

class TakeImagePageView: UIView {
    var takeImageButton: UIButton = {
        var button = Button(buttonStyle: .fill)
        button.setTitle("拍照", for: .normal)
        button.addTarget(nil, action: #selector(TakeImageController.tapTakeImageBtn), for: .touchUpInside)
        return button
    }()

    var setFrame: UIButton = {
        var button = Button(buttonStyle: .fill)
        button.setTitle("選擇相框", for: .normal)
        button.addTarget(nil, action: #selector(TakeImageController.tapSetFrameBtn), for: .touchUpInside)
        return button
    }()

    var buttonOutline: UIButton = {
        var button = Button(buttonStyle: .outline)
        button.setTitle("儲存", for: .normal)
        button.addTarget(nil, action: #selector(TakeImageController.tapSaveBtn), for: .touchUpInside)
        return button
    }()

    lazy var stackView: UIStackView = {
        let subviews = [takeImageButton, buttonOutline]
        var stackView = UIStackView(arrangedSubviews: subviews)
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 6
        stackView.axis = .horizontal
        stackView.isUserInteractionEnabled = true
        return stackView
    }()

    var imageView: UIImageView = {
        var imageView = UIImageView()
        // imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    lazy var button1: UIButton = {
        var button = UIButton()
        button.addTarget(nil, action: #selector(TakeImageController.tapframe1Btn), for: .touchUpInside)
        return button
    }()

    lazy var button2: UIButton = {
        var button = UIButton()
        button.addTarget(nil, action: #selector(TakeImageController.tapframe2Btn), for: .touchUpInside)

        return button
    }()

    lazy var button3: UIButton = {
        var button = UIButton()
        button.addTarget(nil, action: #selector(TakeImageController.tapframe3Btn), for: .touchUpInside)

        return button
    }()

    lazy var button4: UIButton = {
        var button = UIButton()
        button.addTarget(nil, action: #selector(TakeImageController.tapframe4Btn), for: .touchUpInside)

        return button
    }()

    lazy var button5: UIButton = {
        var button = UIButton()
        button.addTarget(nil, action: #selector(TakeImageController.tapframe5Btn), for: .touchUpInside)
        return button
    }()

    lazy var button6: UIButton = {
        var button = UIButton()
        button.addTarget(nil, action: #selector(TakeImageController.tapframe6Btn), for: .touchUpInside)
        return button
    }()

    lazy var frameBox: UIStackView = {
        var viewArray = [button1, button2, button3, button4, button5, button6]
        var stackView = UIStackView(arrangedSubviews: viewArray)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 6
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .customBackgroundColor
        addSubview(stackView)
        addSubview(imageView)
        addSubview(frameBox)
        setConstraints()
    }

    private func setConstraints() {
        imageView.snp.makeConstraints { maker in
            // maker.edges.equalToSuperview().multipliedBy(0.5)
            // maker.height.equalTo(400)
            maker.width.equalTo(400)
            maker.top.equalTo(100)
            maker.centerX.equalToSuperview()
        }
        stackView.snp.makeConstraints { maker in
            maker.top.equalTo(imageView.snp.bottom).offset(edgePaddingY)
            maker.leading.equalTo(edgePaddingX)
            maker.trailing.equalTo(-edgePaddingX)
        }
        frameBox.snp.makeConstraints { maker in
            maker.top.equalTo(stackView.snp.bottom).offset(edgePaddingY)
            maker.leading.equalTo(edgePaddingX)
            maker.trailing.equalTo(-edgePaddingX)
            maker.height.equalTo(50)
        }
    }

    private func setSmallImage(image: UIImage, frameImage: FrameImageType) -> UIImage {
        var newImage = image.resizeImage(size: CGSize(width: 100, height: 100))
        newImage = newImage.addFrame(addframe: frameImage.image)
        return newImage
    }

    private func setButtonsImage(image: UIImage) {
        button1.setImage(setSmallImage(image: image, frameImage: .frameCircle), for: .normal)
        button2.setImage(setSmallImage(image: image, frameImage: .frameFlim), for: .normal)
        button3.setImage(setSmallImage(image: image, frameImage: .frameFlower), for: .normal)
        button4.setImage(setSmallImage(image: image, frameImage: .frameLace), for: .normal)
        button5.setImage(setSmallImage(image: image, frameImage: .FrameWood), for: .normal)
        button6.setImage(setSmallImage(image: image, frameImage: .none), for: .normal)
    }

    func setBigImage(_ image: UIImage) {
        imageView.image = image
    }

    func changeMainPhoto(_ image: UIImage) {
        setBigImage(image)
        setButtonsImage(image: image)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

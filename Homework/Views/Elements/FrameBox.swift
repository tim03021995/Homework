//
//  FrameBox.swift
//  Homework
//
//  Created by goodideas-studio on 2020/11/27.
//

import UIKit

// class FrameBox:UIStackView{
//
//    let imageView = UIImageView.init(image: UIImage(named: "40844393"))
//    lazy var button1 = makeButton(frameImage: .frameCircle)
//    lazy var button2 = makeButton(frameImage: .frameFlim)
//    lazy var button3 = makeButton(frameImage: .frameFlower)
//    lazy var button4 = makeButton(frameImage: .frameLace)
//    lazy var button5 = makeButton(frameImage: .FrameWood)
//
//
//
//    override init() {
//        super.init(arrangedSubviews: [button1,button2,button3,button4,button5])
//    }
//    required init(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    func setImage(){
//
//    }
//    func makeButton(frameImage:FrameImageType)->UIButton{
//        let button = UIButton()
//        var image = imageView.image?.resizeImage(size: CGSize(width: 100, height: 100))
//        image = image?.addFrame(addframe: frameImage.image)
//        button.setImage(image, for: .normal)
//        return button
//    }
// }

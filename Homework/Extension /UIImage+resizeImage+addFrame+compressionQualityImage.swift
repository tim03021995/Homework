//
//  UIImage+resizeImage.swift
//  Homework
//
//  Created by goodideas-studio on 2020/11/27.
//

import UIKit

extension UIImage {
    /// 修改照片的尺寸
    /// - Parameters:
    ///   - size: 目標尺寸
    /// - Returns: 修改完成的照片
    func resizeImage(size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        let newImage = renderer.image { _ in
            self.draw(in: renderer.format.bounds)
        }
        return newImage
    }

    func scale(newWidth: CGFloat) -> UIImage {
        guard size.width != newWidth else { return self }
        print("原本圖片大小為", size)
        let scaleFactor = newWidth / size.width
        let newHeight = size.height * scaleFactor
        let newSize = CGSize(width: newWidth, height: newHeight)
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0.0)
        draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        print("更改後的圖片大小為：", newImage?.size)
        return newImage ?? self
    }

    func addFrame(addframe: UIImage) -> UIImage {
        let size = self.size
        let resizeRightImage = addframe.resizeImage(size: size)
        UIGraphicsBeginImageContext(size)
        draw(at: CGPoint(x: 0, y: 0))
        resizeRightImage.draw(at: CGPoint(x: 0, y: 0))
        let imageLong = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageLong!
    }

    func compressionQualityImage() -> UIImage {
        return UIImage(data: jpegData(compressionQuality: 0.05)!) ?? UIImage(systemName: "photo")!
    }
}

enum FrameImageType {
    case frameCircle, frameFlim, frameFlower, frameLace, FrameWood, none
    var image: UIImage {
        switch self {
        case .frameCircle:
            return UIImage(named: "frame-circle@4500x4500")!
        case .frameFlim:
            return UIImage(named: "frame-film")!
        case .frameFlower:
            return UIImage(named: "frame-flower@4500x4500")!
        case .frameLace:
            return UIImage(named: "frame-lace@4500x4500")!
        case .FrameWood:
            return UIImage(named: "frame-wood@4500x4500")!
        case .none:
            return UIImage()
        }
    }
}

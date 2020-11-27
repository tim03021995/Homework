//
//  TakeImageController.swift
//  Homework
//
//  Created by goodideas-studio on 2020/11/26.
//

import UIKit

class TakeImageController: UIViewController {
    var takeImagePageView = TakeImagePageView()
    var frame: FrameImageType = .frameCircle
    var oriImage = UIImage(named: "40844393")!
    var newImage = UIImage()
    override func loadView() {
        view = takeImagePageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        takeImagePageView.changeMainPhoto(oriImage)
    }

    @objc func tapTakeImageBtn() {
        DispatchQueue.main.async {
            let photoController = UIImagePickerController()
            photoController.delegate = self
            // 模擬器不支援相機功能，因此使用相簿取代，若要使用相機功能請用RELEASE模式，並且在實機上Run
            #if RELEASE
                photoController.sourceType = .camera
            #else
                photoController.sourceType = .photoLibrary
            #endif

            self.present(photoController, animated: true, completion: nil)
        }
    }

    @objc func tapSetFrameBtn() {
        print(#function)
    }

    @objc func tapSaveBtn() {
        print(#function)
        // UIImageWriteToSavedPhotosAlbum(newImage, nil, nil, nil)
        UIImageWriteToSavedPhotosAlbum(newImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }

    @objc func tapframe1Btn() {
        print(#function)
        frame = .frameCircle
        setFrame(frameType: frame)
    }

    @objc func tapframe2Btn() {
        print(#function)
        frame = .frameFlim
        setFrame(frameType: frame)
    }

    @objc func tapframe3Btn() {
        print(#function)
        frame = .frameFlower
        setFrame(frameType: frame)
    }

    @objc func tapframe4Btn() {
        frame = .frameLace
        setFrame(frameType: frame)
    }

    @objc func tapframe5Btn() {
        print(#function)
        frame = .FrameWood
        setFrame(frameType: frame)
    }

    @objc func tapframe6Btn() {
        print(#function)
        frame = .none
        setFrame(frameType: frame)
    }

    @objc func backViewBtnFnc() {
        navigationController?.popViewController(animated: true)
    }

    @objc func image(_: UIImage, didFinishSavingWithError error: NSError?, contextInfo _: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }

    func setFrame(frameType: FrameImageType) {
        var image = oriImage
        image = oriImage.compressionQualityImage()
        image = image.addFrame(addframe: frameType.image)
        takeImagePageView.setBigImage(image)
        newImage = image
    }
}

extension TakeImageController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if var image = info[.originalImage] as? UIImage {
            image = image.scale(newWidth: 200)
            image = image.compressionQualityImage()
            oriImage = image

            setFrame(frameType: frame)
            takeImagePageView.changeMainPhoto(image)
        }
        dismiss(animated: true, completion: nil)
    }
}

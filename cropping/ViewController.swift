//
//  ViewController.swift
//  cropping
//
//  Created by Mohan K on 23/01/23.
//

import UIKit

class ViewController: UIViewController  {

    @IBOutlet weak var cropImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.cropImage.layer.borderWidth = 1
        self.cropImage.layer.borderColor = UIColor.clear.cgColor
        self.cropImage.layer.masksToBounds = false
        self.cropImage.layer.cornerRadius = cropImage.frame.size.width/2
        self.cropImage.clipsToBounds = true
        AddtapGesture()
        
    }

    func AddtapGesture() {
        let tap = UITapGestureRecognizer(target: self,  action: #selector(ImageTapped))
        self.cropImage.isUserInteractionEnabled = true
        self.cropImage.addGestureRecognizer(tap)
        
    }
    
    @objc func ImageTapped() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
}


extension ViewController: UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        let picking = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        self.cropImage.image = picking
        dismiss(animated: true, completion: nil)
    }
}

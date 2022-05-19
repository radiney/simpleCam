//
//  ViewController.swift
//  simpleCam
//
//  Created by user217360 on 5/18/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnCapture: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnCapture.backgroundColor = .systemBlue
        btnCapture.setTitle("Capture", for: .normal)
        btnCapture.setTitleColor(.white, for: .normal)
        
        imageView.backgroundColor = .secondarySystemBackground
    }

    @IBAction func btnCapture(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true, completion: nil)
        
    }
    
}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        imageView.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}


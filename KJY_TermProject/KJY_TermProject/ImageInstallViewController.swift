//
//  ImageInstallViewController.swift
//  KJY_TermProject
//
//  Created by KpuGame on 2020/06/23.
//  Copyright © 2020 KimJiYeong. All rights reserved.
//
import UIKit
import Photos

class ImageInstallViewController: UIViewController
{
    @IBOutlet weak var OutputTextField: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var inputTextField: UITextField!
    var imagePicker = UIImagePickerController()
    
    @IBAction func SetNameAction(_ sender: Any) {
        OutputTextField.text = inputTextField.text
    }
    
    @IBAction func onclick(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
}

extension ImageInstallViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            img.image = image
    }
        if let seletimage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            {
                img.image = seletimage
        }
    dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          let dest = segue.destination
          guard let rvc = dest as? MyMenuViewController else { return }
          rvc.paramImage  = self.img.image
        rvc.paraDicpic = self.OutputTextField.text!
      }
}

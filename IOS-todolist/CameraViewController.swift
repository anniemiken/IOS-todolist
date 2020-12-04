//
//  CameraViewController.swift
//  IOS-todolist
//
//  Created by Annie Johansson on 2020-12-04.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func takePhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            let imagePick = UIImagePickerController()
            imagePick.delegate = self
            imagePick.sourceType = UIImagePickerController.SourceType.camera
            imagePick.allowsEditing = false
            self.present(imagePick, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagePicked = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image.contentMode = .scaleToFill
            image.image = imagePicked
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: Any) {
        let imageData = image.image!.pngData()
        let compressImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressImage!, nil, nil, nil)
        let alertNotation = UIAlertController(title: "Saved", message: "Your image has now been saved", preferredStyle: .alert)
        let action = UIAlertAction(title: "I understand", style: .default, handler: nil)
        alertNotation.addAction(action)
        self.present(alertNotation, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

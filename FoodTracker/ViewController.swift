//
//  ViewController.swift
//  FoodTracker
//
//  Created by Woochan Park on 2020/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    //NOTE: 메서드를 통하지 않고 직접 IBOutlet 에 접근할 수 없다.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        nameTextField.delegate = self
        descriptionTextField.delegate = self
    }
    
    //MARK: Actions
    
    // sender Type 만으로 어떤 타입의 View와 연결되었는지 짐작할 수 있다.
    // Any 로 받으면 유추할 수 없다.
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        // Hide the keyboard.
        if nameTextField.isFirstResponder {
            nameTextField.resignFirstResponder()
        }
        
        
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewContorller is notified when the user picked an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
}

/*
 By adopting the UITextFieldDelegate protocol,
 you tell the compiler that the ViewController class can act as a valid text field delegate.
 
 즉, 적절한 delegate 프로토콜을 채택해야 유효한 delegate로 동작할 수 있다.
 보통 새로운 protocol 을 채택할 때는 extension 을 이용해서 추가한다.
 */
extension ViewController: UITextFieldDelegate {
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //Hide the keyboard.
        textField.resignFirstResponder()
        
        guard textField === nameTextField else {
            return true
        }
        
        descriptionTextField.becomeFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        mealNameLabel.text = textField.text
    }
}

extension ViewController: UIImagePickerControllerDelegate {
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        // Dissmiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following:\(info)")
        }
        
        // Set photoView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UINavigationControllerDelegate {
    
}

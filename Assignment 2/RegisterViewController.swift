//
//  RegisterViewController.swift
//  Assignment 2
//
//  Created by Nguyen, Quoc Hung - nguqy034 on 18/11/21.
//

import UIKit

class RegisterViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var teamName: UITextField!
    @IBOutlet weak var teamID: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var robotName: UITextField!
    @IBOutlet weak var ErrorLabel: UILabel!
    @IBOutlet weak var allow_sharing: UISwitch!
    @IBOutlet var imageViewTapGesture: UITapGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        teamName.delegate = self
        teamID.delegate = self
        location.delegate = self
        robotName.delegate = self
        
        //Add tap gesture and allow user interaction with image, with this tap gesture I can tap image to do actions, and a border to know where to upload image.
        imageView.addGestureRecognizer(imageViewTapGesture)
        imageView.isUserInteractionEnabled = true
        imageView.layer.borderWidth = 1
    }
    
    //End editing when touch Return key.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    //End the editing when touch anywhere but not the text field
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Open camera roll when touch the tap gesture on the image
    @IBAction func OpenCameraRoll(_ sender: UITapGestureRecognizer) {
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary)) && ((sender.view as? UIImageView) != nil) {
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    //After finishing picking up the image, it will set the image of the image view to the selected image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //check if the info is valid or not
    @IBAction func AddTeam(_ sender: UIButton) {
        if (teamName.text != nil && teamName.text != "") && (teamID.text != nil && teamID.text != "") {
            if teamID.text?.count == 5 && Int(teamID.text ?? "") != nil {
                var check = true
                for team in DataManager.shared.registered_profiles {
                    if team.id == teamID.text {
                        check = false
                    }
                }
                if check{
                    let png = ((self.imageView.image?.pngData() ?? UIImage(named: "not_available_img.png")?.pngData())) ?? Data()
                    DataManager.shared.addteamInfo(teamName: teamName.text ?? "", teamID: teamID.text ?? "", location: location.text ?? "N/A", robotName: robotName.text ?? "N/A", image: png, allow_sharing: allow_sharing.isOn)
                    ErrorLabel.text = "Sucessfully registered"
                }
                else{
                    ErrorLabel.text = "Team already registered"
                }
            }
            else {
                ErrorLabel.text = "Invalid ID"
            }
        }
        else {
            ErrorLabel.text = "Insufficient information"
        }
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

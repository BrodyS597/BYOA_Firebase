//
//  DetailViewController.swift
//  MyBills_RTDB
//
//  Created by Brody Sears on 2/22/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: -IBOutlets
    @IBOutlet weak var nameTextFIeld: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var merchantNameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var billImageView: UIImageView!
    
    // MARK: -Properties
    var model: DetailViewModel!
    
    // MARK: -LifeCycle
    override func viewDidLoad() {
        billImageView.contentMode = .scaleAspectFit
        billImageView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(billImageViewTapped))
        billImageView.addGestureRecognizer(tapGesture)
        super.viewDidLoad()
        updateUI()
    }
    
    @objc func billImageViewTapped() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true)
    }
    
    // MARK: -IBActions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextFIeld.text,
              !name.isEmpty,
              let dueDate = dueDateTextField.text,
              let merchant = merchantNameTextField.text,
              let amount = amountTextField.text
        else { return }
        model.SaveBill(withName: name, dueDate: dueDate, merchant: merchant, amount: amount, image: billImageView.image)
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: -Helper func
    private func updateUI() {
        if let bill = model.bill {
            self.nameTextFIeld.text = bill.name
            self.dueDateTextField.text = bill.dueDate
            self.merchantNameTextField.text = bill.merchant
            self.amountTextField.text = bill.amount
            
            model.fetchImage { image in
                if let image = image {
                    self.billImageView.image = image
                }
            }
        }
    }
}

extension DetailViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        self.billImageView.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

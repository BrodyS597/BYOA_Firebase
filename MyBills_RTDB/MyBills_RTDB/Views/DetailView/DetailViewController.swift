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
    
    // MARK: -Properties
    var model: DetailViewModel!
    
    // MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: -IBActions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextFIeld.text,
              !name.isEmpty,
              let dueDate = dueDateTextField.text,
              let merchant = merchantNameTextField.text,
              let amount = amountTextField.text
        else { return }
        model.SaveBill(withName: name, dueDate: dueDate, merchant: merchant, amount: amount)
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: -Helper func
    private func updateUI() {
        if let bill = model.bill {
            self.nameTextFIeld.text = bill.name
            self.dueDateTextField.text = bill.dueDate
            self.merchantNameTextField.text = bill.merchant
            self.amountTextField.text = bill.amount
        }
    }
    
    
}

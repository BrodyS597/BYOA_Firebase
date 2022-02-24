//
//  DetailViewModel.swift
//  MyBills_RTDB
//
//  Created by Brody Sears on 2/22/22.
//

import Foundation
import UIKit
import SwiftUI

class DetailViewModel {
    var bill: Bill?
    private let listViewModel: ListTVCModel
    
    init(bill: Bill? = nil, listTVCModel: ListTVCModel) {
        self.bill = bill
        self.listViewModel = listTVCModel
    }
    
    func SaveBill(withName name: String, dueDate: String, merchant: String, amount: String, image: UIImage?) {
        if let bill = bill {
            bill.name = name
            bill.dueDate = dueDate
            bill.merchant = merchant
            bill.amount = amount
        } else {
            bill = Bill(name: name, dueDate: dueDate, merchant: merchant, amount: amount)
            listViewModel.bills.append(self.bill!)
        }
        FirebaseController().saveBill(self.bill!)
        
        guard let imagedata = image?.pngData() else { return }
        FirebaseStorageController().save(imagedata, toBill: bill!)
    }
    
    func fetchImage(completion: @escaping (UIImage?) -> Void) {
        guard let bill = bill else { return }
        FirebaseStorageController().loadImage(fromBill: bill) { result in
            switch result {
            case .success(let image):
                completion(image)
            case .failure(let error):
                print(error.description)
                completion(nil)
            }
        }
    }
}//End of class

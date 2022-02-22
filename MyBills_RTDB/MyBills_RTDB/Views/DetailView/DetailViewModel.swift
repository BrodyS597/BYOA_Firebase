//
//  DetailViewModel.swift
//  MyBills_RTDB
//
//  Created by Brody Sears on 2/22/22.
//

import Foundation

class DetailViewModel {
    var bill: Bill?
    private let listViewModel: ListTVCModel
    
    init(bill: Bill? = nil, listTVCModel: ListTVCModel) {
        self.bill = bill
        self.listViewModel = listTVCModel
    }
    
    func SaveBill(withName name: String, dueDate: String, merchant: String, amount: String) {
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
    }
}//End of class

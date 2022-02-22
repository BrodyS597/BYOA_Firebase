//
//  FirebaseController.swift
//  MyBills_RTDB
//
//  Created by Brody Sears on 2/22/22.
//

import Foundation
import FirebaseDatabase

struct FirebaseController {
    let ref = Database.database().reference()
    
    func saveBill(_ bill: Bill) {
        ref.child("Bills").child(bill.uuid).setValue(bill.BillData)
    }
    
    func deleteBill(_ bill: Bill) {
        ref.child("Bills").child(bill.uuid).setValue(nil)
    }
}

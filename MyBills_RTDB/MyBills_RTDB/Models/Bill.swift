//
//  Bill.swift
//  MyBills_RTDB
//
//  Created by Brody Sears on 2/22/22.
//

import Foundation

class Bill {
    // MARK: -Keys
    enum Key {
        static let collectionType = "Bills"
        static let name = "name"
        static let dueDate = "dueDate"
        static let merchant = "merchant"
        static let amount = "amount"
        static let uuid = "uuid"
    }
    
    // MARK: -Properties
    var name: String
    let dueDate: String
    var merchant: String
    var amount: Double
    let uuid: String
    
    var BillData: [String: Any] {
        [Key.name : self.name,
         Key.dueDate : self.dueDate,
         Key.merchant : self.merchant,
         Key.amount : self.amount,
         Key.uuid : self.uuid]
    }
    
    // MARK: -Inits
    init(name: String, dueDate: String, merchant: String, amount: Double, uuid: String = UUID().uuidString) {
        self.name = name
        self.dueDate = dueDate
        self.merchant = merchant
        self.amount = amount
        self.uuid = uuid
    }
    
    ///Optional Init
    init?(fromDictionary dictionary: [String: Any]) {
        guard let name = dictionary[Key.name] as? String,
              let dueDate = dictionary[Key.dueDate] as? String,
              let merchant = dictionary[Key.merchant] as? String,
              let amount = dictionary[Key.amount] as? Double,
              let uuid = dictionary[Key.uuid] as? String
        else { return nil }
        
        self.name = name
        self.dueDate = dueDate
        self.merchant = merchant
        self.amount = amount
        self.uuid = uuid
    }
    
}

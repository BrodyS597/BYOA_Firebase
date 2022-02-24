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
        static let imageURL = "imageURL"
    }
    
    var imagePath: String {
        "images/\(self.uuid)"
    }
    
    // MARK: -Properties
    var name: String
    var dueDate: String
    var merchant: String
    var amount: String
    let uuid: String
    var imageURL: URL?
    
    var BillData: [String: Any] {
        [Key.name : self.name,
         Key.dueDate : self.dueDate,
         Key.merchant : self.merchant,
         Key.amount : self.amount,
         Key.uuid : self.uuid,
         Key.imageURL : self.imageURL?.absoluteString ?? nil]
    }
    
    // MARK: -Inits
    init(name: String, dueDate: String, merchant: String, amount: String, uuid: String = UUID().uuidString, imageURL: URL? = nil) {
        self.name = name
        self.dueDate = dueDate
        self.merchant = merchant
        self.amount = amount
        self.uuid = uuid
        self.imageURL = imageURL
    }
    
    ///Optional Init
    init?(fromDictionary dictionary: [String: Any]) {
        guard let name = dictionary[Key.name] as? String,
              let dueDate = dictionary[Key.dueDate] as? String,
              let merchant = dictionary[Key.merchant] as? String,
              let amount = dictionary[Key.amount] as? String,
              let uuid = dictionary[Key.uuid] as? String
        else { return nil }
        
        self.name = name
        self.dueDate = dueDate
        self.merchant = merchant
        self.amount = amount
        self.uuid = uuid
        
        guard let imageURLString = dictionary[Key.imageURL] as? String else { return }
        let imageURL = URL(string: imageURLString)
        self.imageURL = imageURL
    }
}

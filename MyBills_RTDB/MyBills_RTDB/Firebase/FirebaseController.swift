//
//  FirebaseController.swift
//  MyBills_RTDB
//
//  Created by Brody Sears on 2/22/22.
//

import Foundation
import FirebaseDatabase
 
enum FirebaseError: LocalizedError {
    case failure(Error)
    case noData
    case failedToDecode
    
    var description: String {
        switch self {
        case .failure(let error):
            return "\(error.localizedDescription) -> \(error)"
        case .noData:
            return "No data found!"
        case .failedToDecode:
            return "Unable to decode data"
        }
    }
}

struct FirebaseController {
    let ref = Database.database().reference()
    
    func saveBill(_ bill: Bill) {
        ref.child(Bill.Key.collectionType).child(bill.uuid).setValue(bill.BillData)
    }
    
    func deleteBill(_ bill: Bill) {
        ref.child(Bill.Key.collectionType).child(bill.uuid).setValue(nil)
    }
    
    func getBills(completion: @escaping (Result<[Bill], FirebaseError>) -> Void) {
        //Fetching the data from the real time database. Specified by the child key "bills"
        ref.child(Bill.Key.collectionType).getData { error, snapshot in
            //checking to see if there was an error, if so, we complete with a failure and return out of the function.
            if let error = error {
                completion(.failure(.failure(error)))
                return
            }
            //checking to see if we have data, if so, completing with a dictionary of type dictionary
            guard let data = snapshot.value as? [String: [String: Any]] else { completion(.failure(.noData)); return }
            //gets the values from our data dictionary and turns them into an array.
            let dataArray = Array(data.values)
            //Transforms our array of dictionaries into an array of bills
            let bills = dataArray.compactMap({ Bill(fromDictionary: $0) })
            //sorting bills by due date
            let sortedBills = bills.sorted(by: { $0.dueDate > $1.dueDate })
            //completing with our sorted bills
            completion(.success(sortedBills))
        }
    }
}



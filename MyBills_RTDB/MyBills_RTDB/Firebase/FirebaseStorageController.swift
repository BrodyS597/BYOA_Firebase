//
//  FirebaseStorageController.swift
//  MyBills_RTDB
//
//  Created by Brody Sears on 2/24/22.
//

import FirebaseStorage
import UIKit.UIImage

struct FirebaseStorageController {
    let storage = Storage.storage().reference()
    
    func save(_ imageData: Data, toBill bill: Bill) {
        storage.child(bill.imagePath).putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print(error)
                return
            }
            self.storage.child(bill.imagePath).downloadURL { url, error in
                if let error = error {
                    print(error)
                    return
                }
                bill.imageURL = url
            }
        }
    }
    
    func loadImage(fromBill bill: Bill, completion: @escaping (Result<UIImage, FirebaseError>) -> Void) {
        storage.child(bill.imagePath).getData(maxSize: 4000 * 4000) { data, error in
            if let error = error {
                completion(.failure(.failure(error)))
                return
            }
            guard let data = data,
                  let image = UIImage(data: data)
            else { completion(.failure(.noData)); return }
            completion(.success(image))
        }
    }
    
    func deleteImage(fromBill bill: Bill) {
        storage.child(bill.imagePath).delete(completion: nil)
        //add delete button IBAction, in scope, call this func
    }
}

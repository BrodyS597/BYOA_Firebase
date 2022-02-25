//
//  ListTVCModel.swift
//  MyBills_RTDB
//
//  Created by Brody Sears on 2/22/22.
//

import Foundation

protocol ListTVCDelegate: ListTableViewController {
    func updateViews()
}

class ListTVCModel {
    var bills = [Bill]()
    private weak var delegate: ListTVCDelegate?
    var userID: String?
    
    init(delegate: ListTVCDelegate) {
        self.delegate = delegate
        self.fetchBills()
    }
    
    private func fetchBills() {
        FirebaseController().getBills { result in
            switch result {
            case .success(let bills):
                self.bills = bills
                self.delegate?.updateViews()
            case .failure(let error):
                print(error.description)
            }
        }
    }
}

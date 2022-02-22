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
    
    init(delegate: ListTVCDelegate) {
        self.delegate = delegate
    }
}

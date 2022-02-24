//
//  ListTableViewController.swift
//  MyBills_RTDB
//
//  Created by Brody Sears on 2/22/22.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var viewModel: ListTVCModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ListTVCModel(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: -IBActions
    @IBAction func addButtonTapped(_ sender: Any) {
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.bills.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        cell.textLabel?.text = viewModel.bills[indexPath.row].name
        
        return cell
    }
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let billToDelete = viewModel.bills[indexPath.row]
            FirebaseController().deleteBill(billToDelete)
            viewModel.bills.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            if segue.identifier == "showBill",
               let indexPath = tableView.indexPathForSelectedRow {
                let bill = self.viewModel.bills[indexPath.row]
                destination.model = DetailViewModel(bill: bill, listTVCModel: self.viewModel)
            } else {
                destination.model = DetailViewModel(listTVCModel: self.viewModel)
            }
        }
    }
}

extension ListTableViewController: ListTVCDelegate {
    func updateViews() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

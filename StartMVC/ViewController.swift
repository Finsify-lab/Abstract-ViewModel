//
//  ViewController.swift
//  StartMVC
//
//  Created by Pham Quang Thang on 1/13/21.
//

import UIKit

struct Transaction: Codable {
    var amount: Double = 0
    var log: String = ""
}

class ViewController: UIViewController {
    var listTransaction: [Transaction] = [Transaction]()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

//        var transaction = Transaction()
//        transaction.amount = 100
//        transaction.log = "An sang"
//
//        var input = [Transaction]()
//        input.append(transaction)
//
//        let jsonDataInput = try! JSONEncoder().encode(input)
//        let jsonStringInput = String(data: jsonDataInput, encoding: .utf8)
//        UserDefaults.standard.set(jsonStringInput, forKey: "Demo")

        let jsonString = UserDefaults.standard.string(forKey: "Demo")
        let jsonData = jsonString?.data(using: .utf8)!
        listTransaction = try! JSONDecoder().decode([Transaction].self, from: jsonData!)

    }

    @IBAction func addOnClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let transactionEditingVC = storyboard.instantiateViewController(identifier: "TransactionEditingVC") as TransactionEditingVC
        let viewModel = TransactionAddingViewModel()

        transactionEditingVC.viewModel = viewModel
        self.present(transactionEditingVC, animated: true, completion: nil)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let transaction = listTransaction[indexPath.row]

        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "TransactionCellIdentifier")

        cell.textLabel?.text = "\(transaction.amount)"
        cell.detailTextLabel?.text = transaction.log

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTransaction.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let transaction = listTransaction[indexPath.row]

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let transactionEditingVC = storyboard.instantiateViewController(identifier: "TransactionEditingVC") as TransactionEditingVC
        transactionEditingVC.transaction = transaction

        let viewModel = TransactionEditingViewModel(transaction: transaction)
        self.present(transactionEditingVC, animated: true, completion: nil)
    }
}


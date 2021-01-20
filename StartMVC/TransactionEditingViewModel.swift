//
//  TransactionEditingViewModel.swift
//  StartMVC
//
//  Created by Pham Quang Thang on 1/16/21.
//

import UIKit

protocol ViewModelType {
    var completionJob:((String) -> Void)? {get set}

    func getAmount() -> String
    func getDescription() -> String

    func doJob()
    func doQuery()
}

protocol PrivateTransactionViewModel {

}

extension PrivateTransactionViewModel {
    func delayFunction(completion: (String) -> Void) {
        let result = "a"
        completion(result)
    }
}

class TransactionAddingViewModel: ViewModelType, PrivateTransactionViewModel {
    var completionJob: ((String) -> Void)?

    func getAmount() -> String {
        return "nhap amount"
    }

    func getDescription() -> String {
        return "nhap description"
    }

    func doJob() {
        delayFunction { (result) in
            completionJob!("Kết quả adding là \(result)")
        }
    }

    func doQuery() {

        print("add")
    }



}

class TransactionEdittingViewModel: ViewModelType, PrivateTransactionViewModel {
    var completionJob: ((String) -> Void)?

    var transaction: Transaction

    init(transaction: Transaction) {
        self.transaction = transaction
    }
    func getAmount() -> String {
        return "\(transaction.amount)"
    }

    func getDescription() -> String {
        return "\(transaction.log)"
    }

    func doJob() {
        delayFunction { (result) in
            completionJob!("Kết quả edit là \(result)")
        }
    }

    func doQuery() {

        print("edit")
    }

}



class TransactionEditingViewModel: NSObject {

    var amount: String = ""

    var descriptionString: String = ""

    var completionJob:((String) -> Void)?

    var result: String = "" {
        didSet {
            guard let completionJob = completionJob else {
                return
            }

            completionJob(result)
        }
    }

    var transaction: Transaction?

    init(transaction: Transaction?) {
        super.init()
        self.transaction = transaction
        amount = "\(String(describing: transaction?.amount))"
        descriptionString = transaction?.log ?? ""
    }

    func doQuery() {
        if (self.isEditingTransaction()) {
            print("Thực hiện lệnh sửa giao dịch")
        } else {
            print("Thực hiện lệnh thêm giao dịch")
        }
    }

    func doJob() {
        delayFunction { (result) in
            if (self.isEditingTransaction()) {
                self.result = "Kết quả editing là \(result)"
            } else {
                self.result = "Kết quả adding là \(result)"
            }
        }
    }

    func delayFunction(completion: (String) -> Void) {
        let result = "a"
        completion(result)
    }

    func isEditingTransaction() -> Bool {
        if (transaction != nil) {
            return true
        }

        return false
    }
}

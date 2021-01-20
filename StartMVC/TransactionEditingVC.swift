//
//  TransactionEditingVC.swift
//  StartMVC
//
//  Created by Pham Quang Thang on 1/13/21.
//

import UIKit

class TransactionEditingVC: UIViewController {

    var transaction: Transaction? {
        didSet {

        }
    }

    @IBOutlet weak var tfAmount: UITextField!

    @IBOutlet weak var tfDescription: UITextField!

    @IBOutlet weak var lbResult: UILabel!

    var viewModel: ViewModelType?



    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tfAmount.text = viewModel?.getAmount()
        tfDescription.text = viewModel?.getDescription()

        viewModel?.completionJob = { [weak self] result in
            self?.lbResult.text = result
        }
    }

    

    

    @IBAction func saveOnClicked(_ sender: Any) {
        viewModel?.doQuery() 
    }


    @IBAction func backOnClicked(_ sender: Any) {

    }

    @IBAction func job1OnClicked(_ sender: Any) {
        viewModel?.doJob()
    }

}

//
//  SecondViewController.swift
//  adress
//
//  Created by Дмитрий Абдуллаев on 16.11.2022.
//

import UIKit
protocol ViewControllerDelegate {
   
   func addTableDelegate(addForViewController: String)
}

class SecondViewController: UIViewController {
    
    var someText = ""
    var delegate: ViewControllerDelegate?

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = someText

    }
    @IBAction func buttonAction(_ sender: Any) {
        let name = textField.text
        delegate?.addTableDelegate(addForViewController: name!)
        navigationController?.popViewController(animated: true)
    }
}

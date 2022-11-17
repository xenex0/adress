//
//  ViewController.swift
//  adress
//
//  Created by Дмитрий Абдуллаев on 16.11.2022.
//

import UIKit

class ViewController: UIViewController, ViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var data = Adrress.getUserData()
    
    let identifire = "identifire"
    let adressKey = "adressKey"
    var indexPath: IndexPath = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if let direction = UserDefaults.standard.object(forKey: adressKey) as? [String] {
            data.adress = direction
    }
}
    func loadSettings() {
    UserDefaults.standard.set(data.adress, forKey: adressKey)
}
    func addTableDelegate(addForViewController: String) {
        data.adress.append(addForViewController)
        loadSettings()
        tableView.reloadData()
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        let next =  storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        next.delegate = self
        navigationController?.pushViewController(next, animated: true)
    }
    
    @IBAction func itemBar(_ sender: UIBarButtonItem) {
        tableView.isEditing = !tableView.isEditing
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.adress.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: identifire)
        let number = data.adress[indexPath.row]
        cell.textLabel?.text =  number
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            data.adress.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.none)
            loadSettings()
       }
   }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        data.adress.swapAt(sourceIndexPath.row, destinationIndexPath.row)
        loadSettings()
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}


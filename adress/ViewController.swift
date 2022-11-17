//
//  ViewController.swift
//  adress
//
//  Created by Дмитрий Абдуллаев on 16.11.2022.
//

import UIKit

class ViewController: UIViewController, ViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var adresses = ["Дресерувальний майданчик 'Голосієво'","Цимбалевська вулиця, 34", "Стрийська вулиця,11"]
    
    let identifire = "identifire"
    var indexPath: IndexPath = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func addTableDelegate(addForViewController: String) {
        adresses.append(addForViewController)
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
        return adresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: identifire)
        let number = adresses[indexPath.row]
        cell.textLabel?.text =  number
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
     
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (_, _, completionhandler) in
            completionhandler(true)
        }
        adresses.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .top)
        deleteAction.image = UIImage(systemName: "trash")
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        adresses.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}


//
//  ViewController.swift
//  Contacts
//
//  Created by Сергей Бушкевич on 20.07.21.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    private var contacts: [ContactModel] = []

    @IBOutlet weak var tableView: UITableView!
    
    var showVC: ShowVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: ShowVC.identifierVC)
        print("Hello")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadValuesFromDb()
    }
    
    private func loadValuesFromDb(){
        let realm = try! Realm()
        
        contacts = Array(realm.objects(ContactModel.self))
        tableView.reloadData()
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = contacts[indexPath.row].name
        cell?.detailTextLabel?.text = contacts[indexPath.row].surname
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Click")
        
        guard let vc = showVC else {return}
        _ = vc.view
        
        vc.nameLabel.text = contacts[indexPath.row].name
        vc.surnameLabel.text = contacts[indexPath.row].surname
        vc.ageLabel.text = String(contacts[indexPath.row].age)
        vc.phoneLabel.text = contacts[indexPath.row].phone
        
        
        navigationController?.show(vc, sender: nil)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let realm = try! Realm()
            try? realm.write{
                realm.delete(contacts[indexPath.row])
            }
            
            loadValuesFromDb()
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        guard let primary = indexPath?.row else {
            return
        }
    }

}

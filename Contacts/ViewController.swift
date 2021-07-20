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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }

}

//
//  FormVC.swift
//  Contacts
//
//  Created by Сергей Бушкевич on 20.07.21.
//

import UIKit
import RealmSwift

class FormVC: UIViewController {
    
    @IBOutlet weak var nameFiled: UITextField!
    @IBOutlet weak var surNameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveAction(_ sender: Any) {
        guard let name = self.nameFiled.text,
         let surname = self.surNameField.text,
         let age: Int = Int(self.ageField.text ?? ""),
         let phone = self.phoneField.text
        else {return}
        
        let contact = ContactModel(n: name, s: surname, a: age, p: phone)
        let realm = try! Realm()
        
        try? realm.write({
            realm.add(contact)
        })
        
        
        navigationController?.popViewController(animated: true)
    }
    

}

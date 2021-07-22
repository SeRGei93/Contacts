//
//  ShowVC.swift
//  Contacts
//
//  Created by Сергей Бушкевич on 22.07.21.
//

import UIKit
import RealmSwift

class ShowVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var surnameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    static var identifierVC = "detailvc"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
}

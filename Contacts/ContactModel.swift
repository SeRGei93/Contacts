//
//  ContactModel.swift
//  Contacts
//
//  Created by Сергей Бушкевич on 20.07.21.
//

import UIKit
import RealmSwift

class ContactModel: Object {
    @Persisted var id: String = UUID().uuidString
    @Persisted var name: String = ""
    @Persisted var surname: String = ""
    @Persisted var age: Int = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(n:String, s:String, a: Int) {
        self.init()
        self.name = n
        self.surname = s
        self.age = a
    }
}

//
//  SavedData.swift
//  CodeChallenge
//
//  Created by Anh Dinh on 3/14/21.
//

import Foundation
import RealmSwift

// Data structure to save to Realm
class SavedData: Object {
    
    @objc dynamic var id: String?
    @objc dynamic var type: String?
    @objc dynamic var date: String?
    @objc dynamic var data: String?
}

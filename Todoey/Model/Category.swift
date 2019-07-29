//
//  Category.swift
//  Todoey
//
//  Created by 박정현 on 28/07/2019.
//  Copyright © 2019 박정현. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}

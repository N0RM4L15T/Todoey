//
//  Item.swift
//  Todoey
//
//  Created by 박정현 on 27/07/2019.
//  Copyright © 2019 박정현. All rights reserved.
//

import Foundation

class Item: Codable {
    
    init(title : String){
        self.title = title
    }
    
    var title : String
    var done : Bool = false
    
}

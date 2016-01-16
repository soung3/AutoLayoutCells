//
//  Quote.swift
//  Autolayout Project
//
//  Created by Peter Soung on 1/16/16.
//  Copyright © 2016 Peter Soung. All rights reserved.
//

import UIKit

class Quote: NSObject {
    var text: String!
    var imageName: String?
    var personName: String?
    
    convenience init(text:String!, imageName:String?, personName:String?) {
        self.init()
        self.text = text
        self.imageName = imageName
        self.personName = personName
    }
    
}

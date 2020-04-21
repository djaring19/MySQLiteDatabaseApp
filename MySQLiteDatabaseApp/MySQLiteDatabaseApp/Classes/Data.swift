//
//  Data.swift
//  MySQLiteDatabaseApp
//
//  Created by Don Riz Jaring on 4/21/20.
//  Copyright © 2020 DJ Initiatives. All rights reserved.
//

import UIKit

class Data: NSObject {

    var id : Int?
    var name : String?
    var email : String?
    var food : String?
    
    func initWithData(theRow i : Int, theName n : String, theEmail e : String, theFood f : String){
        
        id = i
        name = n
        email = e
        food = f
    }
    
}

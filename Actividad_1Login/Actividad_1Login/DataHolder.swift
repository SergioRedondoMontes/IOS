//
//  DataHolder.swift
//  Actividad_1Login
//
//  Created by Sergio Redondo on 22/3/17.
//  Copyright © 2017 Sergio Redondo. All rights reserved.
//

import UIKit

class DataHolder: NSObject {
    
    static let sharedinstance:DataHolder=DataHolder()
    
    var user:String?
    var pass:String?
    
    var animales:[String]=["perro","gato","pez","dinosaurio","hombre"]
    var images:[String]=["Homer-pythagoras.png","Blinky.png","Homer-pythagoras.png","Blinky.png","Homer-pythagoras.png"]
}

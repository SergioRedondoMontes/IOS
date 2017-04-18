//
//  NSOCoche.swift
//  Actividad_2Login
//
//  Created by Sergio Redondo on 4/4/17.
//  Copyright © 2017 Sergio Redondo. All rights reserved.
//

import UIKit

class NSOCoche: NSObject {
    
    var sNombre:String?
    var sMarca:String?
    var iFabricado:Int?
    var sRutaImagen:String?
    
    init(valores:[String:AnyObject]) {
        sNombre=valores["Nombre"] as? String
        sMarca=valores["Marca"] as? String
        iFabricado=valores["Fabricado"] as? Int
        sRutaImagen=valores["RutaImagen"] as? String
    }
}

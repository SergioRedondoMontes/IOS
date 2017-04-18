//
//  TVCTabla.swift
//  Actividad_1Login
//
//  Created by Sergio Redondo on 23/3/17.
//  Copyright © 2017 Sergio Redondo. All rights reserved.
//

import UIKit
import FirebaseStorage

class TVCTabla: UITableViewCell {
    
    @IBOutlet var lblCelda:UILabel?
    @IBOutlet var imagen:UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func descargarImagen(ruta:String) {
        if (!ruta.isEmpty){
            let islanRef = DataHolder.sharedinstance.firStorageRef?.child(ruta)
        
            islanRef?.data(withMaxSize: 1 * 1024 * 1024){ data, error in
                if error != nil{
                //devulve error no se muestra nada
                }else{
                //si devuelve ruta se muestra imagen
                    let image = UIImage(data: data!)
                    self.imagen?.image=image
                }
            }
        }
    }
}

//
//  VCColeccion.swift
//  Actividad_1Login
//
//  Created by Sergio Redondo on 23/3/17.
//  Copyright © 2017 Sergio Redondo. All rights reserved.
//

import UIKit

class VCColeccion: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var colPrincipal:UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataHolder.sharedinstance.arCoche!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CVCMiCelda2 = collectionView.dequeueReusableCell(withReuseIdentifier: "miCelda2", for: indexPath) as! CVCMiCelda2
        let cochei=DataHolder.sharedinstance.arCoche![indexPath.row]
        //concat = "\(cochei.sNombre!)  \(cochei.sMarca!)"
        let str = String(format: "%@ %@ %d", cochei.sNombre!, cochei.sMarca!, cochei.iFabricado!)
        cell.lblNombre?.text=str
        cell.descargarImagen(ruta: cochei.sRutaImagen!)//        cell.imgMain?.image=UIImage(named:DataHolder.sharedinstance.images[indexPath.row])
        return cell
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

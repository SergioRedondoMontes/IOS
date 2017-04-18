//
//  VCTabla.swift
//  Actividad_1Login
//
//  Created by Sergio Redondo on 23/3/17.
//  Copyright © 2017 Sergio Redondo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class VCTabla: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //var concat:String?
    @IBOutlet var tbnMitabla:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       DataHolder.sharedinstance.firDataBaseRef.child("Coches").observe(FIRDataEventType.value, with: { (snapshot) in
        let arTemp = snapshot.value as? Array<AnyObject>
        
        
        DataHolder.sharedinstance.arCoche=Array<NSOCoche>()
        
        
        for co in arTemp! as [AnyObject] {
            let cochei=NSOCoche(valores: co as! [String:AnyObject])
            DataHolder.sharedinstance.arCoche?.append(cochei)
        }
        
        self.tbnMitabla?.reloadData()
        
        //let coche0 = NSOCoche(valores: arTemp?[0] as! [String : AnyObject])
        //let coche0 = arTemp?[0] as? [String : AnyObject]
        
        })

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(DataHolder.sharedinstance.arCoche==nil){
            return 0
        }else{
            return DataHolder.sharedinstance.arCoche!.count
        }
        //return DataHolder.sharedinstance.animales.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TVCTabla = tableView.dequeueReusableCell(withIdentifier: "MiCelda1") as! TVCTabla
        let cochei=DataHolder.sharedinstance.arCoche![indexPath.row]
        //concat = "\(cochei.sNombre!)  \(cochei.sMarca!)"
        let str = String(format: "%@ %@ %d", cochei.sNombre!, cochei.sMarca!, cochei.iFabricado!)
        cell.lblCelda?.text=str
        cell.descargarImagen(ruta: cochei.sRutaImagen!)
        
//        cell.lblCelda?.text=DataHolder.sharedinstance.animales[indexPath.row]
//        cell.imagen?.image=UIImage(named:DataHolder.sharedinstance.images[indexPath.row])
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

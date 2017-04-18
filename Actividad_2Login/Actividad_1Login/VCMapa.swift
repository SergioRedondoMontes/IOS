//
//  VCMapa.swift
//  Actividad_1Login
//
//  Created by Sergio Redondo on 23/3/17.
//  Copyright © 2017 Sergio Redondo. All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase

class VCMapa: UIViewController, MKMapViewDelegate{
    
    @IBOutlet weak var mapa:MKMapView!
    var pines:[String:MKAnnotation]? = [:]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mapa?.showsUserLocation = true
        
        DataHolder.sharedinstance.firDataBaseRef.child("Coches").observe(FIRDataEventType.value, with: { (snapshot) in
            let arTemp = snapshot.value as? Array<AnyObject>
            
            
            DataHolder.sharedinstance.arCoche=Array<NSOCoche>()
            
            
            for co in arTemp! as [AnyObject] {
                let cochei=NSOCoche(valores: co as! [String:AnyObject])
                DataHolder.sharedinstance.arCoche?.append(cochei)
                
                var coordTemp:CLLocationCoordinate2D = CLLocationCoordinate2D()
                coordTemp.latitude = cochei.dbLat!
                coordTemp.longitude = cochei.dbLon!
                self.agregarPin(coordenada: coordTemp, titulo: cochei.sNombre!)
            }
        })
        
//        let location = CLLocationCoordinate2D(latitude: 40.540109,longitude: -3.893994)
//        
//        let span = MKCoordinateSpanMake(0.2,0.2)
//        let region = MKCoordinateRegion(center:location, span:span)
//        
//        mapa.setRegion(region, animated:true)
//        
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = location
//        mapa.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func agregarPin(coordenada:CLLocationCoordinate2D, titulo varTitulo:String) {
        var annotation:MKPointAnnotation = MKPointAnnotation()
        
        if (pines?[varTitulo]==nil){
            
        }else{
            annotation = pines?[varTitulo] as! MKPointAnnotation
            mapa?.removeAnnotation(annotation)
        }
        
        annotation.coordinate = coordenada
        annotation.title = varTitulo
        pines?[varTitulo] = annotation
        mapa?.addAnnotation(annotation)
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

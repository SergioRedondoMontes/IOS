//
//  VCMapa.swift
//  Actividad_1Login
//
//  Created by Sergio Redondo on 23/3/17.
//  Copyright © 2017 Sergio Redondo. All rights reserved.
//

import UIKit
import MapKit

class VCMapa: UIViewController{
    
    @IBOutlet weak var mapa:MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let location = CLLocationCoordinate2D(latitude: 40.540109,longitude: -3.893994)
        
        let span = MKCoordinateSpanMake(0.2,0.2)
        let region = MKCoordinateRegion(center:location, span:span)
        
        mapa.setRegion(region, animated:true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        mapa.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

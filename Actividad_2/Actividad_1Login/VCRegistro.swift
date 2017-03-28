//
//  VCRegistro.swift
//  Actividad_1Login
//
//  Created by Sergio Redondo on 22/3/17.
//  Copyright © 2017 Sergio Redondo. All rights reserved.
//

import UIKit

class VCRegistro: UIViewController {
    
    @IBOutlet var txtRUsuario:UITextField?
    @IBOutlet var txtRPass:UITextField?
    @IBOutlet var txtCheckPass:UITextField?
    @IBOutlet var lblError:UILabel?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func accionBtnRegistro() {
        if txtRPass?.text==txtCheckPass?.text{
        DataHolder.sharedinstance.user=txtRUsuario?.text
        DataHolder.sharedinstance.pass=txtRPass?.text
        }else{
           lblError?.text=String(format:"Usuario no coincide")
        }
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

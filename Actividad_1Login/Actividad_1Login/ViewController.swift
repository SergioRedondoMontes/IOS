//
//  ViewController.swift
//  Actividad_1Login
//
//  Created by Sergio Redondo on 14/3/17.
//  Copyright © 2017 Sergio Redondo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var btnLogin:UIButton?
    @IBOutlet var txtUsuario:UITextField?
    @IBOutlet var txtPass:UITextField?
    @IBOutlet var lblConsola:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func accionBtnLogear() {
       // lblConsola?.text=String(format:"Usuario o contraseña no validos")
        
        
        if txtUsuario?.text=="a" && txtPass?.text=="a" {
            self.performSegue(withIdentifier: "trans1", sender: self)
        }else{
            lblConsola?.text=String(format:"Usuario o contraseña no validos")
        }
    }
}


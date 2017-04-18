//
//  ViewController.swift
//  Actividad_1Login
//
//  Created by Sergio Redondo on 14/3/17.
//  Copyright © 2017 Sergio Redondo. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet var btnLogin:UIButton?
    @IBOutlet var txtUsuario:UITextField?
    @IBOutlet var txtPass:UITextField?
    @IBOutlet var lblConsola:UILabel?
    @IBOutlet var Load:UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Load?.isHidden=true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func accionBtnLogear() {
       // lblConsola?.text=String(format:"Usuario o contraseña no validos")
        
        FIRAuth.auth()?.signIn(withEmail: (txtUsuario?.text)!, password: (txtPass?.text)!) { (user, error) in
            if (error == nil){
                self.performSegue(withIdentifier: "trans1", sender: self)
            }else{
                self.lblConsola?.text=String(format:"Usuario o contraseña no validos")
            }
            self.Load?.stopAnimating()
        }
        Load?.isHidden=false
        Load?.startAnimating()
    }
}


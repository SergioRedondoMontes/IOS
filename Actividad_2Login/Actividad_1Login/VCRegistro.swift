//
//  VCRegistro.swift
//  Actividad_1Login
//
//  Created by Sergio Redondo on 22/3/17.
//  Copyright © 2017 Sergio Redondo. All rights reserved.
//

import UIKit
import Firebase

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
        
        lblError?.text = ""
        if txtRPass?.text==txtCheckPass?.text{
            FIRAuth.auth()?.createUser(withEmail: (txtRUsuario?.text)!, password: (txtRPass?.text)!) { (user, error) in
                if (error == nil){
                    self.performSegue(withIdentifier: "transRegistro", sender: self)
                }else{
                    if let errCode = FIRAuthErrorCode(rawValue: error!._code) {
                        
                        switch errCode {
                        case .errorCodeInvalidEmail:
                            self.lblError?.text=String(format:"Invalid email")
                        case .errorCodeEmailAlreadyInUse:
                            self.lblError?.text=String(format:"Email in use")
                        default:
                            self.lblError?.text=String(format:"Create User Error: \(error)")
                        }
                    }
                }
            }
        }else{
            self.lblError?.text=String(format:"Passwords does not match")
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

//
//  LoginViewController.swift
//  PathwaySuccess
//
//  Created by Ngo, Billy K on 11/29/17.
//  Copyright © 2017 Ngo, Billy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class LoginViewController: UIViewController {

    var ref: DatabaseReference!
    
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    var alertController: UIAlertController? = nil
    
    @IBAction func loginButton(_ sender: Any) {
        print("logged in button")
        let userID = Auth.auth().currentUser?.uid
        
        if loginEmail.text != nil && loginPassword.text != nil {
            Auth.auth().signIn(withEmail: loginEmail.text!, password: loginPassword.text!, completion: {(user,error) in
                if error != nil {
                    self.alertController = UIAlertController(title: "Incorrect Email or Password", message: "Make sure email comes with @ and password is more than 6 characters", preferredStyle: UIAlertControllerStyle.alert)
                    self.alertController?.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default))
                    self.present(self.alertController!, animated: true, completion: nil)
                }
                else{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "homepage")
                    self.present(vc!, animated: true, completion: nil)
                }
            
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        loginEmail.autocorrectionType = .no
        loginPassword.autocorrectionType = .no
        // Do any additional setup after loading the view.
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

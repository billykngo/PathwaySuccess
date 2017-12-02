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
    
    @IBAction func loginButton(_ sender: Any) {
        print("logged in button")
        let userID = Auth.auth().currentUser?.uid
        
        if loginEmail.text != nil && loginPassword.text != nil {
            Auth.auth().sighIn(withEmail: loginEmail.text, password: loginPassword.text, completion: {(user,error) in
                if error != nil {
                    print("test")
                }
            
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        email.autocorrectionType = .no
        password.autocorrectionType = .no
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

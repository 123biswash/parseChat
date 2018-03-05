//
//  LoginViewController.swift
//  parseChat
//
//  Created by Biswash Adhikari on 2/25/18.
//  Copyright © 2018 Biswash Adhikari. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onLogin(_ sender: Any) {
        let OKAction = UIAlertAction(title: "OK", style: .default)
       
        //var isEmpty: Bool { get }
        
       
        if (usernameField.text != "" && passwordField.text != "") {
            loginUser()
            
        } else{
            // add the OK action to the alert controller
            let alertController = UIAlertController(title: "Error", message: "Empty Username / Password", preferredStyle: .alert)
            alertController.addAction(OKAction)
            present(alertController, animated: true)
            print("username or password field is empty")
 
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        registerUser()
    }
    
    func loginUser() {
        
        let username = usernameField.text
        let password = passwordField.text
        
        
        PFUser.logInWithUsername(inBackground: username!, password: password!) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
            } else {
                print("User logged in successfully")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                // display view controller that needs to shown after successful login
            }
        }
    }
    
    func registerUser() {
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernameField.text
        //newUser.email = emailLabel.text
        newUser.password = passwordField.text
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
            }
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

//
//  loginViewController.swift
//  MovieKernel
//
//  Created by malith on 4/23/19.
//  Copyright © 2019 malith. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import FBSDKLoginKit

class loginViewController: UIViewController,UITextFieldDelegate, GIDSignInUIDelegate, FBSDKLoginButtonDelegate{

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //part of keyboard dismiss
        self.email.delegate = self
        self.password.delegate = self
        
        setupGoogleButton()
        setupFacebookButton()
    }
    
    //keyboard dismiss with return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //keyboard dismiss
    override func touchesBegan(_: Set<UITouch>, with: UIEvent?) {
        email.resignFirstResponder()
        password.resignFirstResponder()
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //add google sign button
    fileprivate func setupGoogleButton(){
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: 16, y: 400, width: view.frame.width - 32, height: 50)
        view.addSubview(googleButton)
        
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    //add facebook sign button
    fileprivate func setupFacebookButton(){
        let facebookButton = FBSDKLoginButton()
        view.addSubview(facebookButton)
        facebookButton.frame = CGRect(x: 16, y: 400 + 66, width: view.frame.width - 32, height: 50)
        facebookButton.delegate = self
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook")
    }
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil{
            print(error)
            return
        }
        print("Successfully logged in with facebook...")
    }
    
    @IBAction func loginAction(_ sender: Any) {
        if email.text?.isEmpty ?? true || password.text?.isEmpty ?? true {
            let alertController = UIAlertController(title: "Error", message: "Empty fields are not allowed", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }else{
            //show spinner
            self.showSpinner(onView: self.view)
            Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
                //hide spinner
                self.removeSpinner()
                if error == nil{
                    self.performSegue(withIdentifier: "goToHomeFromLogin", sender: nil)
                }
                else{
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    
    
    @IBAction func goToSignUp(_ sender: Any) {
        self.performSegue(withIdentifier: "goToRegisterFromLogin", sender: self)
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

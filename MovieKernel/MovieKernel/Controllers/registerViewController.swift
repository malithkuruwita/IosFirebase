//
//  registerViewController.swift
//  MovieKernel
//
//  Created by malith on 4/23/19.
//  Copyright © 2019 malith. All rights reserved.
//

import UIKit
import FirebaseAuth

class registerViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirm: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //keyboard dismiss
        self.email.delegate = self
        self.password.delegate = self
        self.passwordConfirm.delegate = self
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
        passwordConfirm.resignFirstResponder()
        self.view.endEditing(true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        if email.text?.isEmpty ?? true || password.text?.isEmpty ?? true || passwordConfirm.text?.isEmpty ?? true{
            let alertController = UIAlertController(title: "Error", message: "Empty fields are not allowed", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }else{
            if password.text != passwordConfirm.text {
                let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
            else{
                Auth.auth().createUser(withEmail: email.text!, password: password.text!){ (user, error) in
                    if error == nil {
                        self.performSegue(withIdentifier: "goToHomeFromRegister", sender: self)
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
    }
    
    @IBAction func goToSignIn(_ sender: Any) {
        self.performSegue(withIdentifier: "goToLoginFromRegister", sender: nil)
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

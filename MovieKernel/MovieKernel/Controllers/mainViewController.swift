//
//  mainViewController.swift
//  MovieKernel
//
//  Created by malith on 4/23/19.
//  Copyright © 2019 malith. All rights reserved.
//

import UIKit
import Firebase

class mainViewController: UIViewController {

    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if(user != nil){
                self.performSegue(withIdentifier: "goToHomeFromMain", sender: nil)
            }else{
                self.performSegue(withIdentifier: "goToLoginFromMain", sender: nil)
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

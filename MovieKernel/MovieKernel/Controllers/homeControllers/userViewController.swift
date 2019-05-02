//
//  userViewController.swift
//  MovieKernel
//
//  Created by malith on 4/27/19.
//  Copyright © 2019 malith. All rights reserved.
//

import UIKit
import FirebaseAuth

class userViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let settingsData = ["SignOut","Exit","Favourite"]
    let imageData = [#imageLiteral(resourceName: "img_SignOut"),#imageLiteral(resourceName: "img_Exit"),#imageLiteral(resourceName: "img_Favourite")]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let userNib = UINib(nibName: "userTableViewCell", bundle: nil)
        tableView.register(userNib, forCellReuseIdentifier: "userTableViewCell")
        tableView.tableFooterView = UIView()
        
        //sepatrators go edge to edge
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        //tableviewcell border
        tableView.separatorColor = UIColor.green
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.green]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userTableViewCell", for: indexPath) as! userTableViewCell
        //sepatrators go edge to edge
        cell.layoutMargins = UIEdgeInsets.zero
        
        cell.commonInit(imageData[indexPath.item], title: settingsData[indexPath.item])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == [0,0]{
            showAlert(title: "SignOut!", message: "Are you sure you want to SignOut?", handlerOK: {action in
                //call firebase signout method
                self.signOut()
                
            }, handlerCancle: {actionCancel in
                
                self.tableView.deselectRow(at: indexPath, animated: true)
            })
        }else if indexPath == [0,1]{
            showAlert(title: "Exit MovieKernel!", message: "Are you sure you want to exit MovieKernel?", handlerOK: {action in
                //call application exit method
                exit(0)
                
            }, handlerCancle: {actionCancel in
                
                self.tableView.deselectRow(at: indexPath, animated: true)
            })
        }else if indexPath == [0,2]{
            /*let vc = userFavouriteViewController()
            self.navigationController?.pushViewController(vc, animated: true)*/
            self.performSegue(withIdentifier: "userToFavourite", sender: nil)
            self.tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //firebase signout method
    fileprivate func signOut(){
        do {
            try Auth.auth().signOut()
        }
        catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        self.performSegue(withIdentifier: "userToLogin", sender: nil)
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

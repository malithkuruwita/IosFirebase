//
//  hollywoodViewController.swift
//  MovieKernel
//
//  Created by malith on 4/27/19.
//  Copyright © 2019 malith. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


let images = [#imageLiteral(resourceName: "imagePlaceholder"),#imageLiteral(resourceName: "imagePlaceholder"),#imageLiteral(resourceName: "imagePlaceholder"),#imageLiteral(resourceName: "imagePlaceholder"),#imageLiteral(resourceName: "imagePlaceholder"),#imageLiteral(resourceName: "imagePlaceholder")]


class hollywoodViewController: UIViewController, UICollectionViewDataSource, PinterestLayoutDelegate {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var movie = [Movies]()
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        //Do any additional setup after loading the view.
        if let layout = collectionView.collectionViewLayout as? PinterestLayout{
            layout.delegate = self
        }
        collectionView.contentInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
            
            getMovieData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.green]
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let image = images[indexPath.item]
        let height = image.size.height
        
        return height
    }
    
    
    func getMovieData(){
        //show spinner
        self.showSpinner(onView: self.view)
        let databaseRef = Database.database().reference()
        databaseRef.child("movies").observe(.childAdded, with: {
            (snapshot) in
            if !snapshot.exists(){return}
            let movie = Movies(snap: snapshot)
            self.movie.append(movie)
            DispatchQueue.main.async(execute: {
                
                self.collectionView.reloadData()
                
            })
            //hide spinner
            self.removeSpinner()
            
        })
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movie.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! photoCell
        
        cell.imageView.contentMode = UIViewContentMode.scaleAspectFit
        
        //let imageUrl = images[indexPath.item]
        let movies = movie[indexPath.item]
        
        
        imageService.getImage(withURL: movies.mainimgurl){
            image in
            cell.imageView.image = image
        }
        return cell
    }
    
    
  

}










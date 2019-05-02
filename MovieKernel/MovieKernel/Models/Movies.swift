//
//  Movies.swift
//  MovieKernel
//
//  Created by malith on 4/30/19.
//  Copyright © 2019 malith. All rights reserved.
//

import Foundation
import Firebase


class Movies{
    
    var key: String
    var actors: String
    
    var cam: String //imdb url
    var director: String
    var imdb: String
    
    var kollywood: Bool
    var hollywood: Bool
    var bollywood: Bool
    var superhero: Bool
    var populer: Bool
    
    var maincategory: String
    var subcategory: String
    
    var mainimgurl: URL
    var secondimgurl: String
    
    var runtime: String
    var searchname: String
    var filmname: String
    
    
    var sb720p: String
    var sb1080p: String
    var sw1080p: String
    var sw720p: String
    var smb720p: String //size of 720p magnet-blue-ray
    var smb1080p: String //size of 1080p magnet-blue-ray
    var smw1080p: String
    var smw720p: String
    
    var uploaddate: String
    
    var b1080p: String
    var b720p: String
    var mb1080p: String
    var mb720p: String
    var w1080p: String
    var w720p: String
    var mw1080p: String
    var mw720p: String
    
    
    
    
    
    init(snap: DataSnapshot) {
        self.key = snap.key
        
        let movieDict = snap.value as! [String: Any]
        
        self.actors = movieDict["actors"] as! String
        
        self.cam = movieDict["cam"] as! String
        
        self.director = movieDict["director"] as! String
        self.imdb = movieDict["imdb"] as! String
        self.kollywood = movieDict["kollywood"] as! Bool
        self.hollywood = movieDict["hollywood"] as! Bool
        self.bollywood = movieDict["bollywood"] as! Bool
        self.superhero = movieDict["superhero"] as! Bool
        self.populer = movieDict["populer"] as! Bool
        self.maincategory = movieDict["maincategory"] as! String
        self.subcategory = movieDict["subcategory"] as! String
        
        self.mainimgurl = NSURL(string: (movieDict["mainimgurl"] as? String ?? "no image")!)! as URL
        
        
        
        self.secondimgurl = movieDict["secondimgurl"] as! String
        
        self.runtime = movieDict["runtime"] as! String
        self.searchname = movieDict["searchname"] as! String
        self.filmname = movieDict["filmname"] as! String
        
        self.sb720p = movieDict["sb720p"] as? String ?? ""
        self.sb1080p = movieDict["sb1080p"] as? String ?? ""
        self.sw1080p = movieDict["sw1080p"] as? String ?? ""
        self.sw720p = movieDict["sw720p"] as? String ?? ""
        self.smb720p = movieDict["smb720p"] as? String ?? ""
        self.smb1080p = movieDict["smb1080p"] as? String ?? ""
        self.smw1080p = movieDict["smw1080p"] as? String ?? ""
        self.smw720p = movieDict["smw720p"] as? String ?? ""
        
        self.uploaddate = movieDict["uploaddate"] as! String
        
        self.b1080p = movieDict["b1080p"] as? String ?? ""
        self.b720p = movieDict["b720p"] as? String ?? ""
        self.mb1080p = movieDict["mb1080p"] as? String ?? ""
        self.mb720p = movieDict["mb720p"] as? String ?? ""
        self.w1080p = movieDict["w1080p"] as? String ?? ""
        self.w720p = movieDict["w720p"] as? String ?? ""
        self.mw720p = movieDict["mw720p"] as? String ?? ""
        self.mw1080p = movieDict["mw1080p"] as? String ?? ""
    }
    
}


class viewcount{
    var key: String
    var numberOfView: Int
    init(snapshot:DataSnapshot, numberOfView: Int) {
        self.key = snapshot.key
        self.numberOfView = numberOfView
    }
}




/*
init(snapshot: DataSnapshot, actors: String, cam: URL, director: String, imdb: String,kollywood: Bool, hollywood: Bool, bollywood: Bool, superhero: Bool, populer: Bool, maincategory: String, subcategory: String, mainimgurl: URL, secondimgurl: URL, runtime: String, searchname: String, filmname: String, sb720p: String, sb1080p: String, sw1080p: String, sw720p: String, smb720p: String, smb1080p: String, smw1080p: String, smw720p: String, uploaddate: Date, b1080p: URL, b720p: URL, mb1080p: URL, mb720p: URL, w1080p: URL, w720p: URL, mw1080p: URL, mw720p: URL) {
    self.key = snapshot.key
    self.ref = snapshot.ref
    self.actors = actors
    self.cam = cam
    self.director = director
    self.imdb = imdb
    self.kollywood = kollywood
    self.hollywood = hollywood
    self.bollywood = bollywood
    self.superhero = superhero
    self.populer = populer
    self.maincategory = maincategory
    self.subcategory = subcategory
    self.mainimgurl = mainimgurl
    self.secondimgurl = secondimgurl
    self.runtime = runtime
    self.searchname = searchname
    self.filmname = filmname
    self.sb720p = sb720p
    self.sb1080p = sb1080p
    self.sw1080p = sw1080p
    self.sw720p = sw720p
    self.smb720p = smb720p
    self.smb1080p = smb1080p
    self.smw1080p = smw1080p
    self.smw720p = smw720p
    self.uploaddate = uploaddate
    self.b1080p = b1080p
    self.b720p = b720p
    self.mb1080p = mb1080p
    self.mb720p = mb720p
    self.w1080p = w1080p
    self.w720p = w720p
    self.mw720p = mw720p
    self.mw1080p = mw1080p
}*/



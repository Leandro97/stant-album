//
//  ViewController.swift
//  stant-album
//
//  Created by Leandro Martins on 01/10/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var albumCoverImageView: UIImageView!
    @IBOutlet weak var albumNameLabel:      UILabel!
    @IBOutlet weak var artistNameLabel:     UILabel!
    @IBOutlet weak var recordLabel:         UILabel!
    @IBOutlet weak var newAlbumButton:      UIButton!
    
    var albumGenerator            = AlbumGenerator()
    let child                     = SpinnerViewController()
    let gradient: CAGradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.insertSublayer(gradient, at: 0)
        
        albumNameLabel.textColor = UIColor.white
        albumNameLabel.font      = UIFont.boldSystemFont(ofSize: 25)
        albumNameLabel.text      = ""
        
        artistNameLabel.textColor = UIColor.lightGray
        artistNameLabel.text      = ""
        
        recordLabel.textColor = UIColor.lightGray
        recordLabel.text      = ""
        
        newAlbumButton.setTitle("NEW ALBUM", for: .normal)
        newAlbumButton.tintColor          = UIColor.white
        newAlbumButton.titleLabel?.font   = UIFont.boldSystemFont(ofSize: 16)
        newAlbumButton.backgroundColor    = UIColor(red: 30/255, green: 215/255, blue: 96/255, alpha: 1.0)
        newAlbumButton.layer.cornerRadius = 22
        
        getNewAlbum()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        gradient.frame   = self.view.safeAreaLayoutGuide.layoutFrame
        child.view.frame = self.view.safeAreaLayoutGuide.layoutFrame
    }

    @IBAction func getNewAlbumAction(_ sender: Any) {
        self.getNewAlbum()
    }
    
    func getNewAlbum() {
        let albumIndex      = Int.random(in: 0..<albumGenerator.albumList.count)
        let newAlbum: Album = albumGenerator.albumList[albumIndex]
        self.updateFields(newAlbum)
    }
    
    func updateFields(_ album: Album) {
    }
    
    func setBackground(_ image: UIImage) {
        let bgColor        = image.getAverageColor()
        gradient.colors    = [bgColor.cgColor, UIColor.black.cgColor]
        gradient.locations = [0, 1]
    }
}

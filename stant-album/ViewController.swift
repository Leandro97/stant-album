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
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var newAlbumButton: UIButton!
    
    var albumGenerator = AlbumGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNewAlbum()
    }

    @IBAction func getNewAlbumAction(_ sender: Any) {
        self.getNewAlbum()
    }
    
    func getNewAlbum() {
        let albumIndex = Int.random(in: 0..<albumGenerator.albumList.count)
        let newAlbum: Album = albumGenerator.albumList[albumIndex]
        self.updateFields(newAlbum)
    }
    
    func updateFields(_ album: Album) {
        self.albumCoverImageView.image = UIImage(named: album.albumCover!)
        self.albumNameLabel.text = album.albumName!
        self.artistNameLabel.text = album.artistName!
        self.recordLabel.text = album.recordLabel!
    }
    
}


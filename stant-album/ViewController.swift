//
//  ViewController.swift
//  stant-album
//
//  Created by Stant Macmini n04 on 01/10/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var albumCoverImageView: UIImageView!
    @IBOutlet weak var albumNameLabel:      UILabel!
    @IBOutlet weak var artistNameLabel:     UILabel!
    @IBOutlet weak var recordLabel:         UILabel!
    @IBOutlet weak var newAlbumButton:      UIButton!
    
    var image                     = UIImage()
    let loadSpinner               = SpinnerViewController()
    let gradient: CAGradientLayer = CAGradientLayer()
    let apiURL = "https://fakerapiexample.herokuapp.com/album"
    
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
        gradient.frame         = self.view.safeAreaLayoutGuide.layoutFrame
        loadSpinner.view.frame = self.view.safeAreaLayoutGuide.layoutFrame
    }

    @IBAction func getNewAlbumAction(_ sender: Any) {
        self.getNewAlbum()
    }
    
    func showAlert(errorTitle: String, errorMessage: String) {
        let alert = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func getNewAlbum() {
        mapAlbum(url: apiURL, view: self)
    }
    
    func updateFields(album: Album) {
        DispatchQueue.main.sync {
            view.addSubview(loadSpinner.view)
        }
        
        makeRequest(getFromURL: album.albumCover!, requestCompletionHandler: { data, error in
            DispatchQueue.main.sync {
                self.albumNameLabel.text  = album.albumName ?? ""
                self.artistNameLabel.text = album.artistName ?? ""
                self.recordLabel.text     = album.recordLabel ?? ""
                self.image                = UIImage(data: data!)!
                
                self.setCover(image: self.image)
                self.setBackground(image: self.image)
                self.loadSpinner.view.removeFromSuperview()
            }
        })
    }
    
    func setCover(image: UIImage) {
        self.albumCoverImageView.image               = self.image
        self.albumCoverImageView.contentMode         = .scaleToFill
        self.albumCoverImageView.layer.shadowPath    = UIBezierPath(rect: self.albumCoverImageView.bounds).cgPath
        self.albumCoverImageView.layer.shadowRadius  = 10
        self.albumCoverImageView.layer.shadowOffset  = .zero
        self.albumCoverImageView.layer.shadowOpacity = 1
    }
    
    func setBackground(image: UIImage) {
        let bgColor        = image.getAverageColor()
        gradient.colors    = [bgColor.cgColor, UIColor.black.cgColor]
        gradient.locations = [0, 1]
    }
}

//
//  Album.swift
//  stant-album
//
//  Created by Leandro Martins on 01/10/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import Foundation

struct Album {
    let artistName:  String?
    let recordLabel: String?
    let albumName:   String?
    let albumCover:  String?
    
    init(artistName:  String,
         recordLabel: String,
         albumName:   String,
         albumCover:  String) {
        self.artistName  = artistName
        self.recordLabel = recordLabel
        self.albumName   = albumName
        self.albumCover  = albumCover
    }
}

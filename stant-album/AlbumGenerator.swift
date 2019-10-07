//
//  AlbumGenerator.swift
//  stant-album
//
//  Created by Leandro Martins on 01/10/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import Foundation

struct AlbumGenerator {
    let album1 = Album(artistName: "artist 1", recordLabel: "record 1", albumName: "album 1", albumCover: "birds.jpg")
    let album2 = Album(artistName: "artist 2", recordLabel: "record 2", albumName: "album 2", albumCover: "cat.jpg")
    let album3 = Album(artistName: "artist 3", recordLabel: "record 3", albumName: "album 3", albumCover: "dog_img.jpg")
    let album4 = Album(artistName: "artist 4", recordLabel: "record 4", albumName: "album 4", albumCover: "happy_lamb.jpg")
    let album5 = Album(artistName: "artist 5", recordLabel: "record 5", albumName: "album 5", albumCover: "road_image.jpg")
    let albumList: [Album]

    init() {
        albumList = [album1, album2, album3, album4, album5]
    }
}

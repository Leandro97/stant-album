//
//  AlbumGenerator.swift
//  stant-album
//
//  Created by Leandro Martins on 01/10/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import Foundation

struct AlbumGenerator {
    var album1 = Album(id: "1", artistName: "artist 1", recordLabel: "record 1", albumName: "album 1", albumCover: "birds.jpg")
    var album2 = Album(id: "2", artistName: "artist 2", recordLabel: "record 2", albumName: "album 2", albumCover: "cat.jpg")
    var album3 = Album(id: "3", artistName: "artist 3", recordLabel: "record 3", albumName: "album 3", albumCover: "dog_img.jpg")
    var album4 = Album(id: "4", artistName: "artist 4", recordLabel: "record 4", albumName: "album 4", albumCover: "happy_lamb.jpg")
    var album5 = Album(id: "5", artistName: "artist 5", recordLabel: "record 5", albumName: "album 5", albumCover: "road_image.jpg")
    var albumList: [Album]

    init() {
        albumList = [album1, album2, album3, album4, album5]
    }
}

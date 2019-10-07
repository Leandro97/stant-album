//
//  AlbumRequest.swift
//  stant-album
//
//  Created by Leandro Martins on 02/10/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import Foundation

import Foundation
let session = URLSession(configuration: .default)

func makeRequest(getFromURL: String, requestCompletionHandler: @escaping (Data?, Error?) -> Void){
    if let url = URL(string: getFromURL) {
        session.dataTask(with: url) { (data, response, error) in
            if let responseData = data {
                requestCompletionHandler(responseData, nil)
            }
            }.resume()
    }
}


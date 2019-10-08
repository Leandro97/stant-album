//
//  AlbumRequest.swift
//  stant-album
//
//  Created by Leandro Martins on 02/10/19.
//  Copyright © 2019 Stant. All rights reserved.
//

import Foundation
import UIKit

let session = URLSession(configuration: .default)

func makeRequest(getFromURL: String, requestCompletionHandler: @escaping (Data?, Error?) -> Void){
    if let url = URL(string: getFromURL) {
        session.dataTask(with: url) { (data, response, error) in
            requestCompletionHandler(data, error)
            }.resume()
    }
}

func mapAlbum(url: String, view: ViewController) {
    makeRequest(getFromURL: url, requestCompletionHandler: { data, error in
        if let responseData = data {
            do {
                let decodedData = try JSONDecoder().decode(Album.self, from: responseData)
                view.updateFields(album: decodedData)
            } catch {
                view.showAlert(errorTitle: "Server could not be reached", errorMessage: "")
            }
        } else {
            view.showAlert(errorTitle: "No Internet", errorMessage: "Make sure you are connected.")
        }
    })

}

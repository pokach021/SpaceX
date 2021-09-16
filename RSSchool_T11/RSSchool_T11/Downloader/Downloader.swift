//
//  Downloader.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/16/21.
//

import Foundation
import UIKit

struct Downloader {
    func downloadIamge(strUrl: String?) -> UIImage {
        let session = URLSession.shared
        var returnImage: UIImage?
        
        let url = URL(string: strUrl ?? "https://images2.imgbox.com/53/22/dh0XSLXO_o.png")
            
        session.dataTask(with: url!) { (data, response, error) in
                if let data = data, let image = UIImage(data: data) {
                    returnImage = image
                }
            }.resume()
        return returnImage ?? UIImage(named: "safari")!
    }
}

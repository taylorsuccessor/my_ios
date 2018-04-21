//
//  ImageHelper.swift
//  ureed
//
//  Created by mohammad hashom on 4/20/18.
//  Copyright © 2018 mohammad hashom. All rights reserved.
//

import UIKit

extension UIImage {
    convenience init?(urlString: String) {
        
        
        let urlObject=URL(string: urlString)
        
        guard let url = urlObject else { return nil }
        
        do {
            let data = try Data(contentsOf: url)
            self.init(data: data)
        } catch {
            print("Cannot load image from url: \(url) with error: \(error)")
            return nil
        }
    }
}

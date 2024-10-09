//
//  ImageService.swift
//  RetoSwiftSoftTek
//
//  Created by josue on 9/10/24.
//

import SwiftUI

private let _imageCache = NSCache<AnyObject, AnyObject>()

class ImageService: ObservableObject {
    
    // MARK: - PROPERTIES
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    var imageCache = _imageCache
    
    // MARK: - FUNCTIONS
    func loadImage(with path: String) {
        if path == "" { return }
        guard let url = URL(string: path) else {  return }
        self.isLoading = true
        let urlString = url.absoluteString
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            do {
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else {
                    return
                }
                self.imageCache.setObject(image, forKey: urlString as AnyObject)
                DispatchQueue.main.async { [weak self] in
                    self?.isLoading = false
                    self?.image = image
                }
            } catch {
                self.isLoading = false
            }
        }
    }
    
}


//
//  BaseImageView.swift
//  BaseComponents
//
//  Created by Sabri DİNDAR on 10.06.2024.
//

import UIKit

class BaseImageView: UIImageView {
    
    // MARK: - Properties
    var cornerRadius: CGFloat = 0
    fileprivate let cache = NSCache<NSString, UIImage>()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    init(cornerRadius: CGFloat = 0, borderWidht: CGFloat? = 0, placeholder: UIImage? = UIImage(named: "photo")) {
        super.init(frame: .zero)
        self.image = placeholder
        self.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidht!
        initialize()
    }
    
    fileprivate func initialize() {
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Configuration Methods
    func downloadImage(fromURL urlString: String, placeholder: UIImage? = UIImage(named: "photo")) {
        self.image = placeholder
        
        guard let url = URL(string: urlString) else { return }
        
        if let cachedImage = cache.object(forKey: urlString as NSString) {
            self.image = cachedImage
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            if let imageData = try? Data(contentsOf: url), let image = UIImage(data: imageData) {
                self.cache.setObject(image, forKey: urlString as NSString)
                
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
    
    func setImage(fromImage image: UIImage?, placeholder: UIImage? = UIImage(systemName: "photo")) {
        self.image = placeholder
        self.image = image
    }
    
    func resetImage() {
        self.image = nil
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = cornerRadius
    }
}

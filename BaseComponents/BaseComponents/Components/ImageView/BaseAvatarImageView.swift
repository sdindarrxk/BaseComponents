//
//  BaseAvatarImageView.swift
//  BaseComponents
//
//  Created by Sabri DİNDAR on 10.06.2024.
//

import UIKit

class BaseAvatarImageView: BaseImageView {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    override init(cornerRadius: CGFloat = 0, borderWidht: CGFloat? = 0, placeholder: UIImage? = UIImage(systemName: "person")) {
        super.init(borderWidht: 1)
        initialize()
    }
    
    fileprivate func initialize() { }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }
}

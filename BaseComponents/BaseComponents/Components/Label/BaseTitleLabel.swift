//
//  BaseTitleLabel.swift
//  BaseComponents
//
//  Created by Sabri DİNDAR on 10.06.2024.
//

import UIKit

class BaseTitleLabel: UILabel {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    init(_ text: String? = "", textAlignment: NSTextAlignment = .left, fontSize: CGFloat = 16) {
        super.init(frame: .zero)
        self.text = text
        self.textAlignment = textAlignment
        font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        initialize()
    }
    
    // MARK: - Configuration Methods
    fileprivate func initialize() {
        textColor = .label
        font = UIFont.systemFont(ofSize: 16, weight: .bold)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}

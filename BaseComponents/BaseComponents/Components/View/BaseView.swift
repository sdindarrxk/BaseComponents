//
//  BaseView.swift
//  BaseComponents
//
//  Created by Sabri DİNDAR on 10.06.2024.
//

import UIKit

class BaseView: UIView {
    
    // MARK: - Properties
    var cornerRadius: CGFloat = 0
    var borderWidth: CGFloat = 0
    var borderColor: UIColor = .black
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }
    
    init(cornerRadius: CGFloat = 0, borderWidth: CGFloat = 0, borderColor: UIColor = .black) {
        super.init(frame: .zero)
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        setView()
    }
    
    fileprivate func initialize() {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Helper Methods
    fileprivate func setView() {
        prepareView()
        initialize()
    }
    
    func prepareView() { }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}

//
//  GenericXibView.swift
//  BaseComponents
//
//  Created by Sabri DİNDAR on 10.06.2024.
//

import UIKit

class GenericXibView<T>: UIView {
    
    // MARK: - Properties
    private var data: T?
    
    // MARK: - Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadData()
    }
    
    public init(frame: CGRect, data: T? = nil) {
        self.data = data
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // MARK: - Helper Methods
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        addSubview(view)
        loadData()
    }
    
    private func loadViewFromNib() -> UIView? {
        let identifier = String(describing: type(of: self))
        let nib = UINib(nibName: identifier, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func loadData() { }
    
    func setData(with data: T?) {
        self.data = data
        loadData()
    }
    
    func getData() -> T? {
        return data
    }
}

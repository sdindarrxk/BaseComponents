//
//  BaseTextField.swift
//  BaseComponents
//
//  Created by Sabri DİNDAR on 10.06.2024.
//

import UIKit

class BaseTextField: UITextField {
    
    // MARK: - Properties
    var isEmpty: Bool {
        return text?.isEmpty ?? true
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    init(_ text: String? = "", placeholder: String? = "Lüften bir metin giriniz") {
        super.init(frame: .zero)
        self.text = text
        self.placeholder = placeholder
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    fileprivate func initialize() {
        translatesAutoresizingMaskIntoConstraints = false
        
        placeholder = "Lütfen bir metin giriniz"
        layer.borderColor = UIColor.black.cgColor
        textColor = .label
        tintColor = .label
        textAlignment = .left
        font = UIFont.preferredFont(forTextStyle: .subheadline)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        backgroundColor = .systemGray5
        leftViewMode = .always
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 0))
        autocorrectionType = .no
        returnKeyType = .go
        
        addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        addTarget(self, action: #selector(textFieldDidBeginEditing), for: .editingDidBegin)
        addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingDidEnd)
        
        updateButtonState()
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }
    
    // MARK: - Helper Methods
    private func updateButtonState() {
        guard let button = superview?.subviews.compactMap({ $0 as? UIButton }).first else { return }
        button.isEnabled = !isEmpty
    }
    
    // MARK: - TextField Actions
    @objc private func textFieldDidChange() {
        updateButtonState()
    }
    
    @objc private func textFieldDidBeginEditing() {
        UIView.animate(withDuration: 0.3) {
            self.layer.borderWidth = 1
        }
    }
    
    @objc private func textFieldDidEndEditing() {
        UIView.animate(withDuration: 0.3) {
            self.layer.borderWidth = 0
        }
    }
}

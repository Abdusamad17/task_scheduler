import UIKit

class MyTextField: UITextField {
    
    init(placeholder: String, isSecureTextEntry: Bool = false) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.layer.cornerRadius = 25
        self.placeholder = placeholder
        self.textColor = .black
        self.font = .systemFont(ofSize: 16)
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 0))
        self.leftViewMode = .always
        self.isSecureTextEntry = isSecureTextEntry
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


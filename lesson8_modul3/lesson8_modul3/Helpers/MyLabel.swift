import UIKit

class MyLabel: UILabel {
    
    init(text: String, font: UIFont) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = font
        self.textColor = .white
        self.backgroundColor = .clear
        self.text = text
        self.textAlignment = .left
        self.numberOfLines = 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


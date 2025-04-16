import UIKit

class MyButton: UIButton {

    init(title: String, titleColor: UIColor, backgroundColor: UIColor, font: UIFont, action: UIAction?) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = 25
        self.addAction(action!, for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


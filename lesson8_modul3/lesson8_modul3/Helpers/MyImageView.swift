import UIKit

class MyImageView: UIImageView {
    
    init(image: UIImage?, radius: CGFloat) {
        super.init(frame: .zero)

        self.translatesAutoresizingMaskIntoConstraints = false
        if let img = image {self.image = img}
        self.frame = frame
        self.backgroundColor = .lightGray
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
        self.isUserInteractionEnabled = true
        self.layer.cornerRadius = radius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import UIKit

protocol ProtocolWelcome: AnyObject {
    var img: MyImageView { get set }
}

class Welcome: UIViewController, ProtocolWelcome {
    
    var presenter: ProtocolPresenterWelcome!
    
    lazy var img: MyImageView = MyImageView(image: nil, radius: 20)
    
    lazy var labelWelcome: UILabel = MyLabel(text: "Привет\n\(UserDefaults.standard.string(forKey: "name")!)", font: UIFont.systemFont(ofSize: 32, weight: .bold))
    
    lazy var labelEmail: UILabel = MyLabel(text: "Ваш Email: \(UserDefaults.standard.string(forKey: "email")!)", font: UIFont.systemFont(ofSize: 16, weight: .bold))
    
    lazy var labelPassword: UILabel = MyLabel(text: "Ваш Пароль: \(UserDefaults.standard.string(forKey: "password")!)", font: UIFont.systemFont(ofSize: 16, weight: .bold))
    
    lazy var buttonExit: UIButton = MyButton(title: "Выйти", titleColor: .black, backgroundColor: .white, font: .systemFont(ofSize: 16, weight: .bold), action: self.presenter.actionButtonExit)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        self.view.addSubview(img)
        self.view.addSubview(labelWelcome)
        self.view.addSubview(labelEmail)
        self.view.addSubview(labelPassword)
        self.view.addSubview(buttonExit)
        
        self.presenter.setImage()
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            img.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            img.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            img.heightAnchor.constraint(equalToConstant: 130),
            img.widthAnchor.constraint(equalToConstant: 130),
            
            labelWelcome.topAnchor.constraint(equalTo: self.img.bottomAnchor, constant: 30),
            labelWelcome.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 33),
            labelWelcome.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -33),
            labelWelcome.heightAnchor.constraint(equalToConstant: 78),
            
            labelEmail.topAnchor.constraint(equalTo: self.labelWelcome.bottomAnchor, constant: 44),
            labelEmail.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 33),
            labelEmail.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -33),
            labelEmail.heightAnchor.constraint(equalToConstant: 19),
            
            labelPassword.topAnchor.constraint(equalTo: self.labelEmail.bottomAnchor, constant: 7),
            labelPassword.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 33),
            labelPassword.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -33),
            labelPassword.heightAnchor.constraint(equalToConstant: 19),
            
            buttonExit.topAnchor.constraint(equalTo: self.labelPassword.bottomAnchor, constant: 373),
            buttonExit.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            buttonExit.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
            buttonExit.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
}



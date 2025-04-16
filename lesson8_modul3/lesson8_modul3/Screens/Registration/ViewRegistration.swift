import UIKit

protocol ProtocolRegistration: AnyObject {
    var nameTextField: UITextField { get set }
    var emailTextField: UITextField { get set }
    var img: UIImageView { get set }
    var passwordTextField: UITextField { get set }
    var buttonRegistration: UIButton { get set }
    var buttonHaveAkk: UIButton { get set }
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
}

class Registration: UIViewController, ProtocolRegistration {
    
    var presenter: ProtocolPresenterRegistration!

    lazy var labelRegistration: UILabel = MyLabel(text: "Регистрация", font: UIFont.systemFont(ofSize: 32, weight: .bold))
    
    lazy var img: UIImageView = MyImageView(image: nil, radius: 10)
    
    lazy var nameTextField: UITextField = MyTextField(placeholder: "Имя")
    
    lazy var emailTextField: UITextField = MyTextField(placeholder: "email")
    
    lazy var passwordTextField: UITextField = MyTextField(placeholder: "password", isSecureTextEntry: true)
    
    lazy var buttonRegistration: UIButton = MyButton(title: "Регистрация", titleColor: .black, backgroundColor: .white, font: .systemFont(ofSize: 16, weight: .bold), action: self.presenter.actionButtonRegistration)
    
    lazy var buttonHaveAkk: UIButton = MyButton(title: "есть акк", titleColor: .white, backgroundColor: .clear, font: .systemFont(ofSize: 16), action: self.presenter.actionButtonHaveAkk)
    
    private lazy var tap = UITapGestureRecognizer(target: self, action: #selector(tapGest))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.img.addGestureRecognizer(self.tap)
        
        self.view.backgroundColor = .black
        self.view.addSubview(labelRegistration)
        self.view.addSubview(img)
        self.view.addSubview(nameTextField)
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(buttonRegistration)
        self.view.addSubview(buttonHaveAkk)
        setUpConstraints()
    }
    
    @objc func tapGest(sender: UITapGestureRecognizer) {
        self.presenter.imagePicker.showImagePicker(in: self) { image in
            self.img.image = image
        }
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            labelRegistration.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 98),
            labelRegistration.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 33),
            labelRegistration.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -33),
            labelRegistration.heightAnchor.constraint(equalToConstant: 39),
            
            img.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            img.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            img.heightAnchor.constraint(equalToConstant: 100),
            img.widthAnchor.constraint(equalToConstant: 100),
            
            nameTextField.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 60),
            nameTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            nameTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
            nameTextField.heightAnchor.constraint(equalToConstant: 52),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            emailTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
            emailTextField.heightAnchor.constraint(equalToConstant: 52),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            passwordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52),
            
            buttonRegistration.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 115),
            buttonRegistration.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            buttonRegistration.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
            buttonRegistration.heightAnchor.constraint(equalToConstant: 52),
            
            buttonHaveAkk.topAnchor.constraint(equalTo: buttonRegistration.bottomAnchor, constant: 10),
            buttonHaveAkk.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            buttonHaveAkk.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
            buttonHaveAkk.heightAnchor.constraint(equalToConstant: 19),
        ])
    }
}



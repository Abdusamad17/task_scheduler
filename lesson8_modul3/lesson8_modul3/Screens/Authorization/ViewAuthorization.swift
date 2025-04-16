import UIKit

protocol ProtocolAuthorization: AnyObject {
    var emailTextField: UITextField { get set }
    var passwordTextField: UITextField { get set }
    var buttonAuthorization: UIButton { get set }
    var buttonRegistration: UIButton { get set }
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
}

class Authorization: UIViewController, ProtocolAuthorization {
    
    var presenter: ProtocolPresenterAuthorization!

    lazy var labelAuthorization: UILabel = MyLabel(text: "Авторизация", font: UIFont.systemFont(ofSize: 32, weight: .bold))
    
    lazy var emailTextField: UITextField = MyTextField(placeholder: "email")
    
    lazy var passwordTextField: UITextField = MyTextField(placeholder: "password", isSecureTextEntry: true)
    
    lazy var buttonAuthorization: UIButton = MyButton(title: "Войти", titleColor: .black, backgroundColor: .white, font: .systemFont(ofSize: 16, weight: .bold), action: self.presenter.actionButtonAuthorization)
    
    lazy var buttonRegistration: UIButton = MyButton(title: "регистрация", titleColor: .white, backgroundColor: .clear, font: .systemFont(ofSize: 16), action: self.presenter.actionButtonRegistration)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.view.addSubview(labelAuthorization)
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(buttonAuthorization)
        self.view.addSubview(buttonRegistration)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            labelAuthorization.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 205),
            labelAuthorization.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 33),
            labelAuthorization.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -33),
            labelAuthorization.heightAnchor.constraint(equalToConstant: 39),
            
            emailTextField.topAnchor.constraint(equalTo: labelAuthorization.bottomAnchor, constant: 115),
            emailTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            emailTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
            emailTextField.heightAnchor.constraint(equalToConstant: 52),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            passwordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52),
            
            buttonAuthorization.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 115+20+52),
            buttonAuthorization.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            buttonAuthorization.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
            buttonAuthorization.heightAnchor.constraint(equalToConstant: 52),
            
            buttonRegistration.topAnchor.constraint(equalTo: buttonAuthorization.bottomAnchor, constant: 10),
            buttonRegistration.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            buttonRegistration.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -25),
            buttonRegistration.heightAnchor.constraint(equalToConstant: 19)
        ])
    }
}



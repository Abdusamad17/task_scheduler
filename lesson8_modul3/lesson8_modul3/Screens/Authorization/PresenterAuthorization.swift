import UIKit

protocol ProtocolPresenterAuthorization: AnyObject {
    var actionButtonAuthorization: UIAction { get set }
    var actionButtonRegistration: UIAction { get set }
    func authInApp(data: UserLoginData)
}

class PresenterAuthorization: ProtocolPresenterAuthorization {
    
    var view: ProtocolAuthorization?
    private let authManager = ManagerFB()
    
    lazy var actionButtonAuthorization = UIAction(){ [weak self] _ in
        guard let self = self else { return }
        
        //MARK: Если пользователь НЕ ввёл данные
        if (self.view?.emailTextField.text == "" || self.view?.passwordTextField.text == "") {
            presentAlert(title: "Empty fields", message: "Please fill in the missing data", view: self.view!)
            return
        }
        
//        //MARK: Если пользователь НЕ авторизован
//        if (UserDefaults.standard.string(forKey: "isAutorizationPerson")! == "false") {
//            presentAlert(title: "You are not registed", message: "Please register in the app", view: self.view!)
//            return
//        }
        
        let emailText = self.view?.emailTextField.text ?? "nil"
        let passwordText = self.view?.passwordTextField.text ?? "nil"
        
        //MARK: Если пользователь авторизован и ввёл верные данные в поля
//        if (UserDefaults.standard.string(forKey: "email") == emailText && UserDefaults.standard.string(forKey: "password") == passwordText) {
//            self.authInApp(data: UserLoginData(email: emailText, password: passwordText))
//        } else {//MARK: Если пользователь авторизован и ввёл НЕ верные данные в поля
//            presentAlert(title: "You enter wrong email or password", message: "Please enter correct data", view: self.view!)
//        }
        
        self.authInApp(data: UserLoginData(email: emailText, password: passwordText))
        
        
        self.view?.emailTextField.text = ""
        self.view?.passwordTextField.text = ""
    }
    
    lazy var actionButtonRegistration = UIAction(){ [weak self] _ in
        guard let self = self else { return }
        NotificationCenter.default.post(name: Notification.Name(.Screens), object: nil, userInfo: ["view": String.AuthorizationTORegistration])
        
        self.view?.emailTextField.text = ""
        self.view?.passwordTextField.text = ""
    }
    
    init(authorization: ProtocolAuthorization?) {
        self.view = authorization
    }
    
    func authInApp(data: UserLoginData) {
        self.authManager.authInApp(data: data) { result in
            switch result {
            case .success(_):
                NotificationCenter.default.post(name: Notification.Name(.Screens), object: nil, userInfo: ["view": String.AuthorizationToWelcome])
            case .failure(let failure):
                switch failure {
                case ErrorList.notVerified:
                    presentAlert(title: "Error in authInApp", message: "Пользователь не верифицирован", view: self.view!)
                default: //MARK: ErrorList.notUser
                    presentAlert(title: "Error in authInApp", message: "Пользователь не найден в БД", view: self.view!)
                }
            }
        }
    }
}

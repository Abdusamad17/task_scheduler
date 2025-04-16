import UIKit

protocol ProtocolPresenterRegistration: AnyObject {
    var actionButtonRegistration: UIAction { get set }
    var actionButtonHaveAkk: UIAction { get set }
    var imagePicker: MyImagePicker { get set }
    var storageManager: StorageManager { get set }
    func registNewUser(data: UserLoginData)
    
}

class PresenterRegistration: ProtocolPresenterRegistration {
    
    var view: ProtocolRegistration?
    lazy var imagePicker: MyImagePicker = MyImagePicker()
    var storageManager: StorageManager = StorageManager()
    private let registManager = ManagerFB()
    
    lazy var actionButtonRegistration = UIAction() { [weak self] _ in
        guard let self = self else { return }
        
        //MARK: Если пользователь НЕ ввёл какие-то данные
        if (self.view?.nameTextField.text == "") {
            presentAlert(title: "Empty field", message: "Please choose your name", view: self.view!)
            return
        }
        
        if (self.view?.emailTextField.text == "") {
            presentAlert(title: "Empty field", message: "Please choose your email", view: self.view!)
            return
        }
        
        if (self.view?.passwordTextField.text == "") {
            presentAlert(title: "Empty field", message: "Please choose your password", view: self.view!)
            return
        }
        
        if (self.view?.img.image == nil) {
            presentAlert(title: "Missing data", message: "Please choose an avatar", view: self.view!)
            return
        }
        
        let emailText = self.view?.emailTextField.text ?? "nil"
        let nameText = self.view?.nameTextField.text ?? "nil"
        let passwordText = self.view?.passwordTextField.text ?? "nil"
        
        ///Если пользователь ввёл все данные
        UserDefaults.standard.set("true", forKey: "isAutorizationPerson")
        UserDefaults.standard.set(nameText, forKey: "name")
        UserDefaults.standard.set(emailText, forKey: "email")
        UserDefaults.standard.set(passwordText, forKey: "password")
        UserDefaults.standard.set("img.jpeg", forKey: "photo")

        if let dataImageAvatar = (self.view?.img.image)!.jpegData(compressionQuality: 1) {
            self.storageManager.saveData(data: dataImageAvatar)
        }
        
        self.registNewUser(data: UserLoginData(name: nameText, email: emailText, password: passwordText))
        
        self.view?.nameTextField.text = ""
        self.view?.emailTextField.text = ""
        self.view?.passwordTextField.text = ""
    }
    
    lazy var actionButtonHaveAkk = UIAction() { [weak self] _ in
        guard let self = self else { return }
        NotificationCenter.default.post(name: Notification.Name(.Screens), object: nil, userInfo: ["view": String.RegistrationTOAuthorization])
        
        self.view?.nameTextField.text = ""
        self.view?.emailTextField.text = ""
        self.view?.passwordTextField.text = ""
    }
    
    init(registration: ProtocolRegistration?) {
        self.view = registration
    }
    
    func registNewUser(data: UserLoginData) {
        registManager.createNewUser(data: data) { isRegist, error in
            if isRegist {
                NotificationCenter.default.post(name: Notification.Name(.Screens), object: nil, userInfo: ["view": String.RegistrationTOAuthorization])
            } else {
                presentAlert(title: "Error in registNewUser", message: error, view: self.view!)
            }
        }
    }
}

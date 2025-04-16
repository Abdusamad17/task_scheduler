import UIKit

protocol ProtocolPresenterWelcome: AnyObject {
    var actionButtonExit: UIAction {get set}
    var storageManager: StorageManager { get set }
    func setImage()
}

class PresenterWelcome: ProtocolPresenterWelcome {
    
    var view: ProtocolWelcome?
    var storageManager: StorageManager = StorageManager()
    
    init(welcome: ProtocolWelcome?) {
        self.view = welcome
    }
    
    lazy var actionButtonExit = UIAction(){ _ in
        self.storageManager.removeData(image: UserDefaults.standard.string(forKey: "photo")!)
        Builder.setUserDefaults()
        ManagerAuthorization.shared.logOut()
        NotificationCenter.default.post(name: Notification.Name(.Screens), object: nil, userInfo: ["view": String.WelcomeTOAuthorization])
    }
    
    func setImage() {
        if let dataImg = self.storageManager.getData(image: UserDefaults.standard.string(forKey: "photo")!) {
            let image = UIImage(data: dataImg)
            self.view?.img.image = image
        }
    }
}

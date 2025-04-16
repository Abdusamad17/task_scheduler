import UIKit

class Builder {
    static func createRegistration() -> UIViewController {
        let registration = Registration()
        let presenter = PresenterRegistration(registration: registration)
        registration.presenter = presenter
        return registration
    }
    
    static func createAuthorization() -> UIViewController {
        let authorization = Authorization()
        let presenter = PresenterAuthorization(authorization: authorization)
        authorization.presenter = presenter
        return authorization
    }
    
    static func createWelcome() -> UIViewController {
        let welcome = Welcome()
        let presenter = PresenterWelcome(welcome: welcome)
        welcome.presenter = presenter
        return welcome
    }
    
    static func setUserDefaults() {
        UserDefaults.standard.set("false", forKey: "isAutorizationPerson")
        UserDefaults.standard.set("nil", forKey: "name")
        UserDefaults.standard.set("nil", forKey: "email")
        UserDefaults.standard.set("nil", forKey: "password")
        UserDefaults.standard.set("nil", forKey: "photo")
    }
}


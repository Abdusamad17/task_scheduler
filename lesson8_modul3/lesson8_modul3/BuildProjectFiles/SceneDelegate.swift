import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: scene)
        
        let rootVC = ManagerAuthorization.shared.checkAuth()
        ? Builder.createWelcome()
        : Builder.createRegistration()
        
        self.window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()
        
        NotificationCenter.default.addObserver(self, selector: #selector(windowManager(nt: )), name: NSNotification.Name(.Screens), object: nil)
    }
    
    @objc func windowManager(nt: Notification) {
        if let dict = nt.userInfo as? [String: String] {
            switch dict["view"] {
            case .AuthorizationTORegistration:
                self.window?.rootViewController = Builder.createRegistration()
            case .WelcomeTOAuthorization, .RegistrationTOAuthorization:
                self.window?.rootViewController = Builder.createAuthorization()
            default:
                self.window?.rootViewController = Builder.createWelcome()
            }
        }
        
        func sceneDidDisconnect(_ scene: UIScene) {}
        
        func sceneDidBecomeActive(_ scene: UIScene) {}
        
        func sceneWillResignActive(_ scene: UIScene) {}
        
        func sceneWillEnterForeground(_ scene: UIScene) {}
        
        func sceneDidEnterBackground(_ scene: UIScene) {}
        
    }
    
}


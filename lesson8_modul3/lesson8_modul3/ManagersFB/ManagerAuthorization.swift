import Firebase
import FirebaseAuth

class ManagerAuthorization {
    static let shared = ManagerAuthorization()
    private init() {}
    
    //MARK: Пользователь авторизован или нет (nil, если такового нет)
    func checkAuth() -> Bool {
        if let _ = Auth.auth().currentUser {
            return true
        } else {
            return false
        }
    }
    
    //MARK: Выполняет выход из системы текущего пользователя.
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
}

import Firebase
import FirebaseAuth

class ManagerFB {
    func createNewUser(data: UserLoginData, completion: @escaping (Bool, String) -> Void) {
        
        //MARK: Регистрация во вкладке Authentication
        Auth.auth().createUser(withEmail: data.email, password: data.password) { [weak self] result, error in
            guard let self = self else { return }
            //MARK: Ошибка в создании пользователя
            guard error == nil else {
                print(error!.localizedDescription)
                completion(false, error!.localizedDescription)
                return
            }
            
            //MARK: Пользователь создан
            
            //MARK: Добавляем данные не верифицированного пользователя в БД
            setUpUserData(data: data, uid: Auth.auth().currentUser!.uid) {
                //MARK: Отправка письма пользователю, чтобы сделать его верифицированным
                result?.user.sendEmailVerification()
                
                //MARK: Разлогирование пользователя, тк в FB пользователь сразу верифицирован, хоть и не подтвердил email
                ManagerAuthorization.shared.logOut()
                completion(true, "")
            }
        }
        
    }
    
    
    private func setUpUserData(data: UserLoginData, uid: String, completion: @escaping () -> Void) {
        //MARK: Сохранение данных в БД Firestore Database
        Firestore.firestore()
            .collection("users")
            .document(uid)
            .setData([
                "name": data.name ?? "",
                "email": data.email,
                "date": Date()
            ]) { _ in
                completion()
            }
    }
    
    func authInApp(data: UserLoginData, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().signIn(withEmail: data.email, password: data.password) { result, error in
            guard error == nil else {
                print(error!.localizedDescription)
                completion(.failure(error!))
                return
            }
            
            //MARK: Проверка верификации
            guard let user = result?.user else {
                completion(.failure(ErrorList.notUser))
                return
            }
            
            if user.isEmailVerified {
                completion(.success(true))
            } else {
                ManagerAuthorization.shared.logOut()
                completion(.failure(ErrorList.notVerified))
            }
        }
    }
}

enum ErrorList: Error {
    case notVerified
    case notUser
}

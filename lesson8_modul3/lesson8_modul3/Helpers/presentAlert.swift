import UIKit

func presentAlert(title: String, message: String, view: AnyObject) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default)
    alert.addAction(action)
    view.present(alert, animated: true, completion: nil)
}

import UIKit

class MyImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePickerController: UIImagePickerController?
    var completion: ((UIImage) -> Void)?
        
    func showImagePicker(in viewController: UIViewController, completion: ((UIImage) -> Void)?) {
        self.completion = completion
        self.imagePickerController = UIImagePickerController()
        self.imagePickerController?.delegate = self
        viewController.present(self.imagePickerController!, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            self.completion?(image)
            self.imagePickerController?.dismiss(animated: true)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

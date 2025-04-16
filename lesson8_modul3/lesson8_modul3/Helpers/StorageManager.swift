import UIKit

class StorageManager {
    static var url: URL = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)[0]
    
    func saveData(data: Data) {
        let urlPhotos = StorageManager.url.appending(path: "/photos") // .../documents/photos
        try? FileManager.default.createDirectory(at: urlPhotos, withIntermediateDirectories: true)
        let urlImage = urlPhotos.appending(path: "img.jpeg")
        try? data.write(to: urlImage)
        
    }
    
    func getData(image: String) -> Data? {
        let urlPhotos = StorageManager.url.appending(path: "/photos").appending(path: image)
        if let imgData = try? Data(contentsOf: urlPhotos) {
            return imgData
        }
        return nil
    }
    
    func removeData(image: String) {
        let urlPhotos = StorageManager.url.appending(path: "/photos").appending(path: image)
        try? FileManager.default.removeItem(at: urlPhotos)
    }
}

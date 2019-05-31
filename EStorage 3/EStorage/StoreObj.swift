

import UIKit

class StoreObj: NSObject,NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.nameKey)
        aCoder.encode(image, forKey: PropertyKey.imageKey)
    }
    
    struct PropertyKey {
        static let nameKey = "name"
        static let imageKey = "image"
        static let expirationDateKey = "expirationDate"
        static let refreshTokenKey = "refreshToken"
    }
    
    var name: String?
    var image: UIImage?
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as? String
        image = aDecoder.decodeObject(forKey: PropertyKey.imageKey) as? UIImage
        super.init()
    }
    
    override init() {
        super.init()
    }
}

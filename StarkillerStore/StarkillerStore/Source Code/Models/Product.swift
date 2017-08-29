import UIKit
import Unbox

struct Product {
    
    let title: String
    let price: Int
    let zipcode: String
    let seller: String
    let thumbnail: URL
    let date: String
    
}

extension Product: Unboxable {
    
    init(unboxer: Unboxer) throws {
        
        title     = try unboxer.unbox(key: "title")
        price     = try unboxer.unbox(key: "price")
        zipcode   = try unboxer.unbox(key: "zipcode")
        seller    = try unboxer.unbox(key: "seller")
        thumbnail = try unboxer.unbox(key: "thumbnailHd")
        date      = try unboxer.unbox(key: "date")
        
    }
    
}

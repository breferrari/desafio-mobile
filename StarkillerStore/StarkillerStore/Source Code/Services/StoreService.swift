import UIKit
import Moya
import Unbox

class StoreService {
    
    typealias CompletionProducts = (_ products: Array<Product>?) -> Swift.Void
    
    class func fetchProducts(completion: @escaping CompletionProducts) {
        
        let store = MoyaProvider<Store>()
        
        store.request(.products) { (result) in
            switch result {
            case let .success(response):
                
                do {
                    
                    let products: Array<Product> = try unbox(data: response.data)
                    completion(products)
                    
                } catch let error as NSError {
                    
                    print("[StoreService] Error Unboxing Data: \(error)")
                    completion(nil)
                    
                }
                
            case let .failure(error):
                
                handle(error)
                completion(nil)
                
            }
        }
        
    }
    
    private class func handle(_ error: MoyaError) {
        print("[StoreService] Error: \(error)")
    }
    
}

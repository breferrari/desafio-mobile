import UIKit
import Moya

fileprivate struct StoreAPI {
    
    struct Config {
        
        struct Products {
            
            static var endpoint: String {
                return "https://raw.githubusercontent.com/stone-pagamentos/desafio-mobile/master/"
            }
            
            static var path: String {
                return "products.json"
            }
            
        }
        
    }
    
}

enum Store {
    case products
}

extension Store: TargetType {
    
    var baseURL: URL {
        switch self {
        case .products:
            return URL(string: StoreAPI.Config.Products.endpoint)!
        }
    }
    
    var path: String {
        switch self {
        case .products:
            return StoreAPI.Config.Products.path
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .products:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var sampleData: Data {
        switch self {
        case .products:
            guard let url = Bundle.main.url(forResource: "products", withExtension: "json"),
                let data = try? Data(contentsOf: url) else {
                    return Data()
            }
            return data
        }
    }
    
    var task: Task {
        return .request
    }
    
}

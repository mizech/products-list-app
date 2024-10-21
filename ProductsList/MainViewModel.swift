import Foundation

@Observable
class MainViewModel {
    var products = [Product]()
    
    init() {
        let path = Bundle.main.url(forResource: "data", withExtension: "json")
        
        if let path = path {
            
            do {
                let data = try Data(contentsOf: path)
                do {
                    products = try JSONDecoder().decode([Product].self, from: data)
                } catch {
                    print("-- Parsing JSON failed --")
                    print(error)
                }
            } catch {
                print("-- Reading file-content failed --")
                print(error)
            }
        }
    }
}

import Foundation
import SwiftData

@Model
class Product: Identifiable {
    var id: String
    var productCategory: String
    var name: String
    var brand: String
    var desc: String
    var basePrice: Double
    var inStock: Bool
    var stock: Int
    
    init(
        productCategory: String,
        name: String,
        brand: String,
        desc: String,
        basePrice: Double,
        inStock: Bool,
        stock: Int
    ) {
        self.id = UUID().uuidString
        self.productCategory = productCategory
        self.name = name
        self.brand = brand
        self.desc = desc
        self.basePrice = basePrice
        self.inStock = inStock
        self.stock = stock
    }
}

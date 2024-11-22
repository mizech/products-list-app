struct Product: Identifiable, Codable {
    var id: Int
    var productCategory: String
    var name: String
    var brand: String
    var description: String
    var basePrice: Double
    var inStock: Bool
    var stock: Int
}

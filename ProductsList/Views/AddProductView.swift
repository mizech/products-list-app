import SwiftUI
import SwiftData

struct AddProductView: View {
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack {
            Button("Add new product") {
                let product = Product(productCategory: "Category 01", name: "Name 01", brand: "Brand 01", desc: "Description 01", basePrice: 99.99, inStock: true, stock: 4)
                modelContext.insert(product)
            }
        }
    }
}

#Preview {
    AddProductView()
}

import SwiftUI
import SwiftData

struct ProductsListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var products: [Product]
    
    init(searchText: String = "") {
        _products = Query(filter: #Predicate<Product> { product in
            if searchText.isEmpty == true {
                return true
            } else {
                return product.productCategory.localizedStandardContains(searchText) ||
                    product.name.localizedStandardContains(searchText) ||
                    product.brand.localizedStandardContains(searchText) ||
                    product.desc.localizedStandardContains(searchText)
            }
        }, sort: [SortDescriptor(\Product.name)])
    }
    
    var body: some View {
        List {
            ForEach(products) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(product.name)
                            .font(.title2.bold())
                        Text(product.desc)
                            .lineLimit(2)
                        HStack {
                            Text(product.basePrice, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                                .fontWeight(.bold)
                            Spacer()
                            Text("\(product.inStock ? "In Stock" : "Out of Stock")")
                        }
                    }
                }
            }.onDelete { indexSet in
                for i in indexSet {
                    let product = products[i]
                    modelContext.delete(product)
                }
            }
        }
    }
}

#Preview {
    ProductsListView(searchText: "Test_1")
}

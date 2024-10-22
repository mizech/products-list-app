import SwiftUI

struct ContentView: View {
    @State private var mainVM = MainViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(mainVM.products) { product in
                    NavigationLink(destination: ProductDetailView(product: product)) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(product.name)
                                .font(.title2.bold())
                            Text(product.description)
                                .lineLimit(1)
                            HStack {
                                Text(product.basePrice, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                                    .fontWeight(.bold)
                                Spacer()
                                Text("\(product.inStock ? "In Stock" : "Out of Stock")")
                            }
                        }
                    }
                }
            }.listStyle(.plain)
                .navigationTitle("Products")
        }
    }
}

#Preview {
    ContentView()
}

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(product.name)
                .font(.title.bold())
            Text("Vendor: \(product.brand)")
                .font(.title2)
            Text("Category: \(product.productCategory)")
            Image(Fake.imgs[Int.random(in: 0..<Fake.imgs.count)])
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .frame(maxWidth: .infinity, maxHeight: 400)
            HStack {
                Text(product.basePrice, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                    .font(.title2.bold())
                Spacer()
                Text("Currently \(product.stock) in stock")
            }
            Text(product.description)
                .font(.subheadline)
            Spacer()
        }.padding()
         .padding(.horizontal, 15)
         .background(.linearGradient(colors: [.white, .lightGray],
                                     startPoint: .topTrailing,
                                     endPoint: .bottomLeading))
    }
}

#Preview {
    ProductDetailView(product: Product(id: 1, productCategory: "Category 1", name: "Name 1", brand: "Brand 1", description: "Some text with a description ...", basePrice: 99.99, inStock: true, stock: 16))
}

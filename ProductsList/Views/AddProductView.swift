import SwiftUI
import SwiftData

struct AddProductView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var category = ""
    @State private var name = ""
    @State private var brand = ""
    @State private var desc = ""
    @State private var basePrice: Double? = nil
    @State private var inStock = false
    @State private var stock: Int? = nil
    
    var body: some View {
        NavigationView {
            Form {
                Section("Product category") {
                    TextField("Enter a category", text: $category)
                }
                Section("Product name") {
                    TextField("Enter a name", text: $name)
                }
                Section("Product brand") {
                    TextField("Enter the brand", text: $brand)
                }
                Section("Product description") {
                    TextField("Enter a description", text: $desc)
                }
                Section("Product base-price") {
                    TextField("Enter a price", value: $basePrice, format: .number)
                        .keyboardType(.numberPad)
                }
                Section("Product stock") {
                    TextField("How many products are on stock?", value: $stock, format: .number)
                        .keyboardType(.numberPad)
                }
                
                Button {
                    guard category.isEmpty == false &&
                            name.isEmpty == false &&
                            brand.isEmpty == false else {
                        return
                    }
                    
                    let product = Product(
                        productCategory: category,
                        name: name,
                        brand: brand,
                        desc: desc,
                        basePrice: basePrice ?? 0.0,
                        inStock: stock ?? 0 > 0 ? true : false,
                        stock: stock ?? 0
                    )
                    modelContext.insert(product)
                    dismiss()
                } label: {
                    Text("Add product")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 12.0))
                }
            }
                .navigationTitle("Enter product-data")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add product", systemImage: "xmark.circle") {
                            dismiss()
                        }
                    }
                }
        }
    }
}

#Preview {
    AddProductView()
}

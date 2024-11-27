import SwiftUI
import SwiftData

enum Actions {
    case edit
    case add
}

struct ProductFormView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var category = ""
    @State private var name = ""
    @State private var brand = ""
    @State private var desc = ""
    @State private var basePrice: Double? = nil
    @State private var inStock = false
    @State private var stock: Int? = nil
    
    var title: String
    var action: Actions
    var product: Product?
    
    init(
        product: Product? = nil,
        title: String
    ) {
        if let product = product {
            self.product = product
            
            self.category = product.productCategory
            self.name = product.name
            self.brand = product.brand
            self.desc = product.desc
            self.basePrice = product.basePrice
            self.stock = product.stock
            self.inStock = product.inStock
            
            self.action = Actions.edit
        } else {
            self.category = ""
            self.name = ""
            self.brand = ""
            self.desc = ""
            self.basePrice = 0
            self.stock = 0
            self.inStock = false
            
            self.action = Actions.add
        }
    
        self.title = title
    }
    
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
                    
                    switch action {
                        case .edit:
                            product?.productCategory = category
                            product?.name = name
                            product?.brand = brand
                            product?.desc = desc
                            product?.basePrice = basePrice ?? 0
                            product?.inStock = stock ?? 0 > 0 ? true : false
                            product?.stock = stock ?? 0
                            
                            do {
                                try modelContext.save()
                            } catch {
                                print(error)
                            }
                        case .add:
                            let product = Product(
                                productCategory: category,
                                name: name,
                                brand: brand,
                                desc: desc,
                                basePrice: basePrice ?? 0,
                                inStock: stock ?? 0 > 0 ? true : false,
                                stock: stock ?? 0
                            )
                            modelContext.insert(product)
                    }
                    
                    dismiss()
                } label: {
                    Text("Submit")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 12.0))
                }
            }
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("", systemImage: "xmark.circle") {
                            dismiss()
                        }
                    }
                }
        }
        .onAppear {
            UITextField.appearance().clearButtonMode = .whileEditing
        }
    }
}

#Preview {
    ProductFormView(
        product: Product(
            productCategory: "",
            name: "",
            brand: "",
            desc: "",
            basePrice: 0,
            inStock: false,
            stock: 4
        ),
        title: "Title"
    )
}

import SwiftUI

struct ProductFormView: View {

    let product: QRProductDTO
    @StateObject private var viewModel = ProductViewModel()

    var body: some View {
        VStack(spacing: 16) {

            Text("Confirmar Produto")
                .font(.title2)

            Text("Produto: \(product.product_id)")
            Text("Serial: \(product.serial)")
            Text("Lote: \(product.batch)")

            if viewModel.isLoading {
                ProgressView()
            }

            if let error = viewModel.errorMessage {
                Text(error).foregroundColor(.red)
            }

            Button("Cadastrar Produto") {
                Task {
                    await viewModel.register(product: product)
                }
            }
            .buttonStyle(.borderedProminent)

            NavigationLink("", destination: SuccessView(),
                           isActive: $viewModel.success)
        }
        .padding()
    }
}
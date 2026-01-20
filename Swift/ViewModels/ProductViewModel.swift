import Foundation

@MainActor
final class ProductViewModel: ObservableObject {

    @Published var isLoading = false
    @Published var success = false
    @Published var errorMessage: String?

    func register(product: QRProductDTO) async {
        isLoading = true
        errorMessage = nil

        do {
            try await NetworkManager.shared.postProduct(product: product)
            success = true
        } catch {
            errorMessage = "Erro ao cadastrar produto"
        }

        isLoading = false
    }
}
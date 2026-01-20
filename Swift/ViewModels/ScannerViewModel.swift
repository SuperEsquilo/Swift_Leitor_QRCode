import Foundation

final class ScannerViewModel: ObservableObject {
    @Published var scannedProduct: QRProductDTO?

    func processQRCode(_ code: String) {
        guard let data = code.data(using: .utf8),
              let product = try? JSONDecoder().decode(QRProductDTO.self, from: data) else {
            print("QR inválido")
            return
        }
        scannedProduct = product
    }
}

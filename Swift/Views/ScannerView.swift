import SwiftUI

struct ScannerView: View {

    @StateObject private var viewModel = ScannerViewModel()
    @State private var navigate = false

    var body: some View {
        NavigationStack {
            ZStack {
                CameraView(viewModel: viewModel)

                VStack {
                    Text("Escaneie o QR Code do Produto")
                        .foregroundColor(.white)
                        .padding()
                }
            }
            .navigationDestination(isPresented: $navigate) {
                ProductFormView(product: viewModel.scannedProduct!)
            }
            .onChange(of: viewModel.scannedProduct) {
                if $0 != nil { navigate = true }
            }
        }
    }
}

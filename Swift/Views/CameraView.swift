import SwiftUI
import UIKit

struct CameraView: UIViewRepresentable {

    let viewModel: ScannerViewModel

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let scanner = QRScannerService()
        scanner.delegate = context.coordinator
        scanner.startScanning(on: view)
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(viewModel: viewModel)
    }

    final class Coordinator: NSObject, QRScannerDelegate {
        let viewModel: ScannerViewModel

        init(viewModel: ScannerViewModel) {
            self.viewModel = viewModel
        }

        func didScan(code: String) {
            viewModel.processQRCode(code)
        }
    }
}

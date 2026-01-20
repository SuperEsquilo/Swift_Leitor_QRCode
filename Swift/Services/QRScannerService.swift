import AVFoundation
import UIKit

protocol QRScannerDelegate: AnyObject {
    func didScan(code: String)
}

final class QRScannerService: NSObject, AVCaptureMetadataOutputObjectsDelegate {

    weak var delegate: QRScannerDelegate?
    private let session = AVCaptureSession()

    func startScanning(on view: UIView) {
        guard let device = AVCaptureDevice.default(for: .video),
              let input = try? AVCaptureDeviceInput(device: device) else { return }

        let output = AVCaptureMetadataOutput()
        output.setMetadataObjectsDelegate(self, queue: .main)

        session.addInput(input)
        session.addOutput(output)
        output.metadataObjectTypes = [.qr]

        let preview = AVCaptureVideoPreviewLayer(session: session)
        preview.frame = view.bounds
        preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(preview)

        session.startRunning()
    }

    func metadataOutput(_ output: AVCaptureMetadataOutput,
                        didOutput metadataObjects: [AVMetadataObject],
                        from connection: AVCaptureConnection) {
        guard let object = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
              let value = object.stringValue else { return }

        session.stopRunning()
        delegate?.didScan(code: value)
    }
}

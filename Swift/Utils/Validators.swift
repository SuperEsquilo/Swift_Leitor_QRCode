enum Validators {

    static func isValidQRCode(_ code: String) -> Bool {
        return code.contains("product_id")
    }
}
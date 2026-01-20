struct Product: Codable, Identifiable {
    let id: String
    let serial: String
    let batch: String
    let manufactureDate: String
    let createdAt: String
}
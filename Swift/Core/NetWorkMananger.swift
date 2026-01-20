import Foundation

final class NetworkManager {

    static let shared = NetworkManager()
    private init() {}

    func postProduct(product: QRProductDTO) async throws {
        let url = URL(string: APIEndpoints.registerProduct)!
        var request = URLRequest(url: url)

        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(AuthManager.shared.token)", forHTTPHeaderField: "Authorization")

        request.httpBody = try JSONEncoder().encode(product)

        let (_, response) = try await URLSession.shared.data(for: request)
        guard let http = response as? HTTPURLResponse, http.statusCode == 201 else {
            throw URLError(.badServerResponse)
        }
    }
}

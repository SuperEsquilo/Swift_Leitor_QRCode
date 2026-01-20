final class AuthManager {
    static let shared = AuthManager()
    private init() {}

    var token: String {
        return UserDefaults.standard.string(forKey: "auth_token") ?? ""
    }
}

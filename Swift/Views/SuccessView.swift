import SwiftUI

struct SuccessView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 64))
                .foregroundColor(.green)

            Text("Produto cadastrado com sucesso!")
                .font(.title2)
        }
    }
}
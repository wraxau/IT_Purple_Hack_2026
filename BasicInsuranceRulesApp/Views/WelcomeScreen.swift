import SwiftUI

struct WelcomeView: View {
    let onStart: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            

            Image("welcome")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 287, maxHeight: 287)
                .padding(.top, 60)

            Text("Привет!")
                .font(AppTypography.delaTitleLarge)
                .foregroundColor(.textPrimary)
                .padding(.top, 20)
            
            VStack(spacing: 16) {
                Text("Иногда в жизни случаются\nнеприятные ситуации.")
                    .multilineTextAlignment(.center)
                    .font(AppTypography.delaSubtitle)
                    .foregroundColor(.textPrimary)
                
                Text("Риск - это вероятность,\nчто такая ситуация\nпроизойдёт.")
                    .multilineTextAlignment(.center)
                    .font(AppTypography.delaSubtitle)
                    .foregroundColor(.textPrimary)
                
                Text("Давай посмотрим, какие\nбывают риски и как их\nможно предусмотреть.")
                    .multilineTextAlignment(.center)
                    .font(AppTypography.delaSubtitle)
                    .foregroundColor(.textPrimary)
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            Button(action: onStart) {
                Text("К темам")
                    .font(AppTypography.delaSubtitle)
                    .foregroundColor(.textPrimary)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(Color.lime)
            .cornerRadius(30)
            .shadow(color: .black.opacity(0.1), radius: 5, y: 5)
            .padding(.horizontal, 40)
            .padding(.bottom, 40)
        }
        .background(Color.appBackground)
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    WelcomeView(onStart: {})
}

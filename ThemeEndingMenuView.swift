import SwiftUI

struct ThemeEndingMenuView: View {
    let topicName: String
    let onSelectAnother: () -> Void
    let onFinish: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            Text(topicName)
                .font(AppTypography.delaButton)
                .foregroundColor(.darkBlue)
                .padding(.top, 40)

            Spacer()

            VStack(spacing: 0) {
                Text("Что делаем дальше?")
                    .font(AppTypography.delaTitle)
                    .foregroundColor(.darkBlue)

                VStack(spacing: 16) {
                    Button(action: onSelectAnother) {
                        Text("Выбрать другую тему")
                            .font(AppTypography.delaBody)
                    }
                    .appStyle(.chooseAnotherTopicButton)
                    
                    Button(action: onFinish) {
                        Text("Закончить")
                            .font(AppTypography.delaBody)
                    }
                    .appStyle(.stopGameButton)
                }
                .padding(.top, 50)
            }
            .padding(.horizontal, 40)

            Spacer()
        }
        .background(Color(.systemBackground))
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    ThemeEndingMenuView(
        topicName: "Телефон",
        onSelectAnother: {},
        onFinish: {}
    )
}


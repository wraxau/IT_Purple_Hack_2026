import SwiftUI

struct ThemeEndingMenuView: View {
    let topicName: String
    let onSelectAnother: () -> Void
    let onFinish: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            
            Text(topicName)
                .font(.custom("DelaGothicOne-Regular", size: 17))
                .foregroundColor(.darkBlue)
                .padding(.top, 40)
            
            Spacer()
            
            Text("Что делаем дальше?")
                .font(.custom("DelaGothicOne-Regular", size: 24))
                .foregroundColor(.darkBlue)
            
            VStack(spacing: 16) {
                Button(action: onSelectAnother) {
                    Text("Выбрать другую тему")
                        .font(.custom("DelaGothicOne-Regular", size: 18))
                }
                .appStyle(.chooseAnotherTopicButton)
                
                Button(action: onFinish) {
                    Text("Закончить")
                        .font(.custom("DelaGothicOne-Regular", size: 18))
                }
                .appStyle(.stopGameButton) 
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


import SwiftUI

struct BasicScreenView: View {
    let config: TextButtonImageScreenConfig
    let onButtonTap: (String) -> Void
    
    private let darkBlue = Color(red: 47/255, green: 54/255, blue: 124/255)
    private var isThemeEndingMenuScreen: Bool {
        config.title == "Что делаем дальше?" && (config.image == nil || config.image?.isEmpty == true)
    }
    
    private var textTopPadding: CGFloat {
        if let imageName = config.image, !imageName.isEmpty {
            return 6
        } else {
            return 170
        }
    }

    private var buttonsTopPadding: CGFloat {
        if isThemeEndingMenuScreen {
            return 50
        }

        let hasImage = config.image != nil && !config.image!.isEmpty
        let hasText = config.text != nil && !config.text!.isEmpty
        
        if !hasImage && !hasText {
            return 170
        } else {
            return 50
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            Text(config.title ?? "Тема")
                .font(.custom("DelaGothicOne-Regular", size: 17))
                .foregroundColor(darkBlue)
                .padding(.top, isThemeEndingMenuScreen ? 220 : 40)
            
            if let imageName = config.image, !imageName.isEmpty {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 250)
                    .padding(.top, 20)
            }
            
            if let text = config.text, !text.isEmpty {
                Text(text)
                    .font(.custom("DelaGothicOne-Regular", size: 17))
                    .foregroundColor(darkBlue)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.top, textTopPadding)
            }
            
            if isThemeEndingMenuScreen {
                Spacer(minLength: 30)
            } else {
                Spacer()
            }
            
            VStack(spacing: 22) {
                ForEach(Array(config.buttons.enumerated()), id: \.offset) { index, button in
                    Button(action: {
                        print("Нажата кнопка: \(button.action)")
                        onButtonTap(button.action)
                    }) {
                        Text(button.title)
                            .font(.custom("DelaGothicOne-Regular", size: 15))
                            .foregroundColor(textColor(for: index))
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(bgColor(for: index))
                    .clipShape(Capsule())
                    .overlay(
                        Capsule()
                            .stroke(Color.white, lineWidth: 1.5)
                    )
                    .shadow(color: .black.opacity(0.1), radius: 4, y: 2)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, buttonsTopPadding)
            .padding(.bottom, 40)
            
        }
        .background(Color(.systemBackground))
        .ignoresSafeArea(.keyboard)
    }
    

    private func bgColor(for index: Int) -> Color {
        switch index {
        case 0: return Color(red: 0.75, green: 0.88, blue: 1.0)
        case 1: return Color(red: 0.53, green: 0.64, blue: 1.0)
        case 2: return Color(red: 1.0, green: 0.70, blue: 0.97)
        default: return .gray
        }
    }
    

    private func textColor(for index: Int) -> Color {
        switch index {
        case 0: return Color(red: 0.15, green: 0.23, blue: 0.51)
        case 1: return Color(red: 1.0, green: 0.70, blue: 0.97)
        case 2: return Color(red: 0.89, green: 0.98, blue: 0.53)
        default: return .black
        }
    }
}

#Preview("Только кнопки") {
    BasicScreenView(
        config: TextButtonImageScreenConfig(
            image: nil,
            title: "Выбор",
            text: "",
            buttons: [
                ButtonConfig(title: "А. Вариант 1", style: .variantAButton, action: "opt1"),
                ButtonConfig(title: "В. Вариант 2", style: .variantBButton, action: "opt2"),
                ButtonConfig(title: "С. Вариант 3", style: .variantCButton, action: "opt3")
            ]
        ),
        onButtonTap: { _ in }
    )
}

#Preview("С контентом") {
    BasicScreenView(
        config: TextButtonImageScreenConfig(
            image: "welcome",
            title: "Питомцы",
            text: "Симбочка попал в неприятность...\nЧто случилось?",
            buttons: [
                ButtonConfig(title: "А. Сломал лапку", style: .variantAButton, action: "broken_leg"),
                ButtonConfig(title: "В. Отравился", style: .variantBButton, action: "poison"),
                ButtonConfig(title: "С. Оглох", style: .variantCButton, action: "def")
            ]
        ),
        onButtonTap: { _ in }
    )
}

import SwiftUI

struct HowItWorksView: View {
    let config: HowItWorksScreen
    let onClose: () -> Void
    
    var body: some View {
        ZStack {
            // Затемнение фона
            Color.overlay.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    onClose()
                }
            
            // Карточка с инструкцией
            VStack(spacing: 0) {
                // 1. Шапка с кнопками
                HStack {
                    // Крестик слева
                    Button(action: onClose) {
                        Image(systemName: "xmark")
                            .font(AppTypography.systemTitle)
                            .foregroundColor(.onLight)
                            .frame(width: 44, height: 44)
                            .background(Color.surfaceMuted)
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    // Заголовок
                    Text("Как это работает?")
                        .font(AppTypography.systemBody)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    // Галочка справа
                    Button(action: onClose) {
                        Image(systemName: "checkmark")
                            .font(AppTypography.systemTitle)
                            .foregroundColor(.onLight)
                            .frame(width: 44, height: 44)
                            .background(Color.lime.opacity(0.3))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
                
                // 2. Список шагов
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        ForEach(Array(config.steps.enumerated()), id: \.offset) { index, step in
                            StepView(stepNumber: index + 1, stepText: step, textColor: .black)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                }
            }
            .frame(maxWidth: 400)
            .background(Color.surface)
            .cornerRadius(24)
            .padding(.horizontal, 20)
        }
    }
}

// MARK: - Step View
struct StepView: View {
    let stepNumber: Int
    let stepText: String
    let textColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            // Разделяем текст по двоеточию
            let components = stepText.components(separatedBy: ":")
            let title = components.first?.trimmingCharacters(in: .whitespaces) ?? ""
            let description = components.dropFirst().joined(separator: ":").trimmingCharacters(in: .whitespaces)
            
            // Заголовок шага (номер + текст)
            HStack(alignment: .top, spacing: 8) {
                Text("\(stepNumber).")
                    .font(AppTypography.systemBody)
                    .foregroundColor(textColor)
                
                Text(title)
                    .font(AppTypography.systemBody)
                    .foregroundColor(textColor)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            // Описание шага
            if !description.isEmpty {
                Text(description)
                    .font(AppTypography.systemBody)
                    .foregroundColor(textColor)
                    .padding(.leading, 24)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

// Превью
#Preview {
    HowItWorksView(
        config: HowItWorksScreen(
            title: "Как это работает?",
            steps: [
                "Оформляешь страховку: Выбираешь тариф и подключаешь защиту для своего смартфона.",
                "Если что-то случилось: Телефон сломался, разбился или его украли - сообщаешь об этом на сайте страховой компании.",
                "Подаёшь заявку: Описываешь ситуацию и при необходимости прикладываешь фото или документы.",
                "Получаешь решение: Страховая компания проверяет заявку.",
                "Ремонт или компенсация: Тебе оплачивают ремонт или выплачивают компенсацию."
            ]
        ),
        onClose: {}
    )
}

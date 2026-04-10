struct WhatIfAlternative {
    let label: String
    let actionID: String  // ID для расчёта альтернативы
}

struct WhatIfConfig {
    let title: String
    let alternatives: [WhatIfAlternative]
}

import Foundation

// MARK: - 1. Конвертер валют с обработкой ошибок:

//•     Создайте enum Currency с кейсами для USD, EUR, BYN. Каждому кейсу присвойте rawValue типа String с соответствующим кодом валюты.
//•     Создайте функцию getExchangeRate(from: Currency, to: Currency) -> Double?, которая принимает две валюты и возвращает курс обмена между ними. Если для какой-то пары валют курс не найден, функция должна возвращать nil.
//•   Создайте функцию convertCurrency(amount: Double, from: Currency, to: Currency) -> Double?, которая принимает сумму, исходную валюту и целевую валюту и возвращает сконвертированную сумму. Используйте функцию getExchangeRate для получения курса обмена. Если курс обмена не найден, функция должна возвращать nil.

enum Currency: String {
    case USD = "USD"
    case EUR = "EUR"
    case BYN = "BYN"
    
    func getExchangeRate(to other: Currency) -> Double? {
        switch (self, other) {
        case (.USD, .EUR):
            return 0.93
        case (.USD, .BYN):
            return 3.27
        case (.BYN, .USD):
            return 0.31
        case (.EUR, .BYN):
            return 3.49
        default:
            return nil
        }
    }
    
    func convertCurrency(amount: Double, to other: Currency) -> Double? {
        guard let rate = getExchangeRate(to: other) else {
            return nil
        }
        return amount * rate
    }
}

//Test
print("------------task 1------------")
print(Currency.USD.getExchangeRate(to: .EUR) ?? "no exchange rate")
print(Currency.USD.getExchangeRate(to: .BYN) ?? "no exchange rate")
print(Currency.BYN.getExchangeRate(to: .EUR) ?? "no exchange rate")
print(Currency.USD.convertCurrency(amount: 200, to: .BYN) ?? "no exchange rate")
print(Currency.EUR.convertCurrency(amount: 521.2, to: .BYN) ?? "no exchange rate")
print(Currency.EUR.convertCurrency(amount: 25.19, to: .USD) ?? "no exchange rate")


// MARK: -2. Анализатор результатов экзамена:

//•   Создайте enum Grade с кейсами A, B, C, D, F.  Каждому кейсу присвойте rawValue типа Int, представляющий числовой балл (например, A = 90, B = 80 и т.д.).
//•   Создайте функцию getLetterGrade(score: Int) -> Grade?, которая принимает числовой балл (Int) и возвращает соответствующую буквенную оценку (Grade).  Если балл находится вне допустимого диапазона (например, меньше 0 или больше 100), функция должна возвращать nil.  Реализуйте логику определения оценки на основе диапазонов баллов (например, 90-100 -> A, 80-89 -> B и т.д.).
//•   Создайте функцию printExamResult(name: String, score: Int) -> String, которая принимает имя студента (String) и его балл (Int) и возвращает строку с результатом экзамена. Используйте функцию getLetterGrade для получения буквенной оценки.

//•   Если функция getLetterGrade возвращает оценку, строка должна иметь формат: "[Имя студента] получил [Буквенная оценка] (Балл: [Числовой балл])".
//•   Если функция getLetterGrade возвращает nil, строка должна иметь формат: "[Имя студента] получил недопустимый балл: [Числовой балл]".

//•   Продемонстрируйте работу функции printExamResult с разными входными данными, включая допустимые и недопустимые баллы.

enum Grade: Int {
    case A = 50
    case B = 40
    case C = 30
    case D = 20
    case F = 10
    
    func getLetterGrade(score: Int) -> Grade? {
        switch score {
        case 41...50:
            return .A
        case 31...40:
            return .B
        case 21...30:
            return .C
        case 11...20:
            return .D
        case 0...10:
            return .F
        default:
            return nil
        }
    }
    
    func printExamResult(name: String, score: Int) -> String {
        if let grade = getLetterGrade(score: score) {
            return "\(name) received \(String(describing: self)) (Score: \(score))"
        } else {
            return "\(name) received invalid score: \(score)"
        }
    }
}


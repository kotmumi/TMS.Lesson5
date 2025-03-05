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
}

import Foundation

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
        case 41...50
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
}

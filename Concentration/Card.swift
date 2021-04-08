import Foundation

struct Card {
    
    var isFaceUp = false
    var isMathces =  false
    var indetifire: Int
    
    private static var identifierNumber = 0
    
    private static func identifierGenerator() -> Int {
        
        identifierNumber += 1
        return identifierNumber
    }
    
    //Сам инициализатор генерирует indetifire
    init() {
        self.indetifire = Card.identifierGenerator()
    }
}

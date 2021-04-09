import Foundation

struct Card: Hashable {
    
    var isFaceUp = false
    var isMathces =  false
    private var indetifire: Int
    
    private static var identifierNumber = 0
    
    private static func identifierGenerator() -> Int {
        
        identifierNumber += 1
        return identifierNumber
    }
    
    //Сам инициализатор генерирует indetifire
    init() {
        self.indetifire = Card.identifierGenerator()
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(indetifire)
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.indetifire == rhs.indetifire
    }
}

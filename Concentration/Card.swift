import Foundation

struct Card
{
    var isFaceUp = false
    var isMathces =  false
    var indetifire: Int
    
    static var identifierNumber = 0
    
    static func identifierGenerator() -> Int
    {
        identifierNumber += 1
        return identifierNumber
    }
    
    init() {
        self.indetifire = Card.identifierGenerator()
    }
}

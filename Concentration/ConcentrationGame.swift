import Foundation

class ConcentrationGame
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int)
    {
        if !cards[index].isMathces {
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
                if cards[matchingIndex].indetifire == cards[index].indetifire {
                    cards[matchingIndex].isMathces = true
                    cards[index].isMathces = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDown in cards.indices {
                    cards[flipDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numderOfPairsOfCards: Int)
    {
        for _ in 1...numderOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
        //TODO: Shuffle the card
    }
}

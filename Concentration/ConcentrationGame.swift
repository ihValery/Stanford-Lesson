import Foundation

struct ConcentrationGame {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        //Смотрим на все карты и и проверяем если одна единственная карточка
        get {
            
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
            
//            return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
/*
            var foundIndex: Int?
            for i in cards.indices {
                if cards[i].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = i
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
 */
        }
        //Переворачиваем все карти лицом вниз кроме одной с индексом newValue
        set {
            for i in cards.indices {
                cards[i].isFaceUp = (i == newValue)
            }
        }

    }
    
    mutating func chooseCard(at index: Int) {
        
        if !cards[index].isMathces {
            if let matchingIndex = indexOfOneAndOnlyFaceUpCard, matchingIndex != index {
                if cards[matchingIndex] == cards[index] {
                    cards[matchingIndex].isMathces = true
                    cards[index].isMathces = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    //Инициализатор который заполняет массив карточек
    init(numderOfPairsOfCards: Int) {
        
        assert(numderOfPairsOfCards > 0, "Парных карт не должно быть меньше нуля")
        for _ in 1...numderOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
}

extension Collection {
    
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}

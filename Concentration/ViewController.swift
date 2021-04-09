import UIKit

class ViewController: UIViewController {
    
    private lazy var game = ConcentrationGame(numderOfPairsOfCards: numderOfPairsOfCards)
    
    var numderOfPairsOfCards: Int {
        return (buttonCollection.count + 1) / 2
    }
    
    private(set) var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
//    private var emojiCollection = ["🦄", "🦋", "🐣", "🐠", "🐳", "🕊", "🦩", "🦒", "🦎", "🐇", "🐬", "🐢",]
    
    private var emojiCollection = "🦄🦋🐣🐠🐳🕊🦩🦒🦎🐇🐬🐢"
    
    private var emojiDictionary = [Card:String]()
    
    @IBOutlet private weak var touchLabel: UILabel!
    @IBOutlet private var buttonCollection: [UIButton]!
    
    @IBAction private func buttonAction(_ sender: UIButton) {
        
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
        touches += 1
    }
    
    private func emojiIdentifier(for card: Card) -> String {
        
        if emojiDictionary[card] == nil {
            let randomStringIndex = emojiCollection.index(emojiCollection.startIndex, offsetBy: emojiCollection.count.randomIndexEmoji)
            emojiDictionary[card] = String(emojiCollection.remove(at: randomStringIndex))
        }
        return emojiDictionary[card] ?? "?"
    }
    
    private func updateViewFromModel() {
        
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emojiIdentifier(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMathces ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0, green: 0.3231856227, blue: 0.5848054886, alpha: 1)
            }
        }
    }
}

extension Int {
    
    var randomIndexEmoji: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
//    var randomIndexEmoji: Int {
//        if self > 0 {
//            return Int.random(in: 0..<self)
//        } else if self < 0 {
//            return -Int.random(in: 0..<abs(self))
//        } else {
//            return 0
//        }
//    }
}

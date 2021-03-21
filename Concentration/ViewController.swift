import UIKit

class ViewController: UIViewController
{
    lazy var game = ConcentrationGame(numderOfPairsOfCards: (buttonCollection.count + 1) / 2)
    var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    var emojiCollection = ["🦄", "🦋", "🐣", "🐠", "🐳", "🕊", "🦩", "🦒", "🦎", "🐇", "🐬", "🐢",]
    
    var emojiDictionary = [Int:String]()
    
    @IBOutlet weak var touchLabel: UILabel!
    @IBOutlet var buttonCollection: [UIButton]!
    
    @IBAction func buttonAction(_ sender: UIButton)
    {
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
        touches += 1
    }
    
    func emojiIdentifier(for card: Card) -> String
    {
        if emojiDictionary[card.indetifire] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
            emojiDictionary[card.indetifire] = emojiCollection.remove(at: randomIndex)
        }
        return emojiDictionary[card.indetifire] ?? "?"
    }
    
    func updateViewFromModel()
    {
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

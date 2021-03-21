import UIKit

class ViewController: UIViewController
{
    var touches = 0 {
        didSet {
            touchLabel.text = "Touches: \(touches)"
        }
    }
    
    let emojiCollection = ["🦄", "🦋", "🦄", "🦋"]
    
    @IBOutlet weak var touchLabel: UILabel!
    @IBOutlet var buttonCollection: [UIButton]!
    
    @IBAction func buttonAction(_ sender: UIButton)
    {
        if let buttonIndex = buttonCollection.firstIndex(of: sender) {
            flipButton(emoji: emojiCollection[buttonIndex], button: sender)
        }
        touches += 1
    }
    
    func flipButton(emoji: String, button: UIButton)
    {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0, green: 0.3231856227, blue: 0.5848054886, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}

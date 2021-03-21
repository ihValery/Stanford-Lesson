import UIKit

class ViewController: UIViewController
{
    var touches = 0
    
    @IBOutlet weak var touchLabel: UILabel!
    @IBOutlet var buttonCollection: [UIButton]!
    
    @IBAction func buttonAction(_ sender: UIButton)
    {
        touches += 1
        touchLabel.text = "Touches: \(touches)"
    }
    
    
}

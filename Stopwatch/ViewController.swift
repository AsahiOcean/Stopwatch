import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pause: UIButton!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var go: UIButton!
    
    @IBAction func goTouch(_ sender: UIButton) {
        go.isEnabled = false
        pause.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target:self, selector: #selector(self.UpdateTimer), userInfo: nil, repeats: true)
        isGo = true
    }
    
    @objc func UpdateTimer() {
         counter = counter + 0.1
     }
    
    @IBAction func pauseTouch(_ sender: UIButton) {
        self.go.isEnabled = true
        self.pause.isEnabled = false
        if let timerTemp = timer {
            timerTemp.invalidate()
        }
        self.timer = nil
        self.isGo = false
    }

    @IBAction func reset(_ sender: UIButton) {
        if let timerTemp = timer {
            timerTemp.invalidate()
        }
        self.timer = nil
        self.isGo = false
        self.counter = 0
        self.go.isEnabled = true
        self.pause.isEnabled = true
    }
    
    var timer: Timer? = Timer()
    var isGo = false
    
    var counter: Float = 0.0 {
        didSet {
            time.text = String(format: "%.1f", counter)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 0.0
    }
}

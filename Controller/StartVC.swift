import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var circles: [UIView]!
    
    @IBOutlet weak var titleLabel: UILabel!
    var count = 0
    var firstTrack = ""
    var pass = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons.forEach { (button) in
            button.layer.cornerRadius = 40
            button.clipsToBounds = true
            button.layer.borderWidth = 1
            button.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
        
        circles.forEach { (view) in
            view.layer.cornerRadius = 10
            view.clipsToBounds = true
            view.layer.borderWidth = 2
            view.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        let wasIntroWatched = userDefaults.bool(forKey: "wasIntroWatched")
        
        guard !wasIntroWatched else { return }
        
        if let pageViewController = storyboard?.instantiateViewController(withIdentifier: "pageViewController") as? PageViewController {
            present(pageViewController, animated: true, completion: nil)
        }
    }
    
    func showErrorMessage() {
        let alertVC = UIAlertController(title: "Пароли не совпадают", message: "Повторите ещё раз", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { _ in
            self.reset()
        }
        alertVC.addAction(ok)
        present(alertVC,animated: true)
    }
    
    func nextSymbol(_ symbol: String) {
        pass += symbol
        
        circles[count].backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        
        count += 1
        
        if count == 4 {
            if firstTrack != "" {
                if firstTrack == pass {
                    let vc = storyboard?.instantiateViewController(withIdentifier: "mainNavigationController")
                    present(vc!, animated: true, completion: nil)
                } else {
                    showErrorMessage()
                }
                
                
            } else {
                firstTrack = pass
                count = 0
                pass = ""
                circles.forEach{$0.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)}
                titleLabel.text = "Подтвердтие пароль"
            }
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        reset()
    }
    
    func reset() {
        pass = ""
        firstTrack = ""
        count = 0
        titleLabel.text = "Придумайте пароль"
        circles.forEach{$0.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)}
    }
    
    @IBAction func didTap(_ sender: UIButton) {
        switch sender.currentTitle {
        case "1":
            nextSymbol("1")
        case "2":
            nextSymbol("2")
        case "3":
            nextSymbol("3")
        case "4":
            nextSymbol("4")
        case "5":
            nextSymbol("5")
        case "6":
            nextSymbol("6")
        case "7":
            nextSymbol("7")
        case "8":
            nextSymbol("8")
        case "9":
            nextSymbol("9")
        case "0":
            nextSymbol("0")
        default:
            print("Fuuu")
        }
    }
}

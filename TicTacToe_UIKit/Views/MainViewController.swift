import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var crossButton: UIButton!
    @IBOutlet weak var circleButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    private var choose: Player!

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupButton()
    }

    @IBAction func crossButtonTapped(_ sender: UIButton) {
        choose = .x
        crossButton.isEnabled.toggle()
        circleButton.isEnabled = true
        startButton.isEnabled = true
    }

    @IBAction func circleButtonTapped(_ sender: UIButton) {
        choose = .o
        crossButton.isEnabled = true
        circleButton.isEnabled.toggle()
        startButton.isEnabled = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let gameVC = segue.destination as? GameViewController
        else { return }
        gameVC.currentPlayer = choose
    }
}

extension MainViewController {
    private func setupButton() {
        startButton.layer.cornerRadius = startButton.frame.height / 2
        crossButton.layer.cornerRadius = startButton.frame.height / 2
        circleButton.layer.cornerRadius = startButton.frame.height / 2
    }
}

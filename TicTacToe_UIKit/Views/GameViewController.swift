import UIKit

class GameViewController: UIViewController {
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var currentPlayerLabel: UILabel!
    private var game = TicTacToeGame()
    var currentPlayer: Player!

    override func viewDidLoad() {
        super.viewDidLoad()
        buttons.forEach { button in
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.black.cgColor
            button.setTitleColor(.systemOrange, for: .disabled)
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        }
        updateCurrentPlayer()
    }

    @IBAction func resetGameTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension GameViewController {
    @objc func buttonTapped(_ sender: UIButton) {
        guard let index = buttons.firstIndex(of: sender) else { return }

        let row = index / 3
        let column = index % 3

        if game.updateBoard(row: row, column: column, player: currentPlayer) {
            updateButtonTitle(button: sender, with: currentPlayer.mark)

            if game.checkWinningCombination(player: currentPlayer) {
                showAlert(title: "\(currentPlayer.mark) Wins!", message: "Congratulations!")
                resetGame()
            } else if checkForTie() {
                showAlert(title: "Tie Game", message: "Better luck next time!")
                resetGame()
            } else {
                currentPlayer = currentPlayer == .x ? .o : .x
                updateCurrentPlayer()

            }
        }
    }

    func updateCurrentPlayer() {
        let attributedString = NSMutableAttributedString(string: "Ходит: ")
        let playerMark = NSAttributedString(
            string: "\(currentPlayer.mark)",
            attributes: [.foregroundColor: UIColor.systemOrange]
        )
        attributedString.append(playerMark)
        currentPlayerLabel.attributedText = attributedString
    }

    func updateButtonTitle(button: UIButton, with player: String) {
        button.setTitle(player, for: .normal)
        button.isEnabled = false
    }

    func checkForTie() -> Bool {
        for row in game.board {
            if row.contains("") {
                return false
            }
        }
        return true
    }

    func resetGame() {
        currentPlayer = currentPlayer == .x ? .o : .x

        game.board = Array(repeating: Array(repeating: "", count: 3), count: 3)

        for button in buttons {
            button.setTitle("", for: .normal)
            button.isEnabled = true
        }
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

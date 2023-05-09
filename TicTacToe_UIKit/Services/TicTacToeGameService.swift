class TicTacToeGame {
    var board = Array(repeating: Array(repeating: "", count: 3), count: 3)

    func checkWinningCombination(player: Player) -> Bool {
        // Check for horizontal win
        for i in 0..<3 {
            if board[i][0] == player.mark && board[i][1] == player.mark && board[i][2] == player.mark {
                return true
            }
        }

        // Check for vertical win
        for i in 0..<3 {
            if board[0][i] == player.mark && board[1][i] == player.mark && board[2][i] == player.mark {
                return true
            }
        }

        // Check for diagonal win
        if board[0][0] == player.mark && board[1][1] == player.mark && board[2][2] == player.mark {
            return true
        }

        if board[0][2] == player.mark && board[1][1] == player.mark && board[2][0] == player.mark {
            return true
        }

        return false
    }

    func updateBoard(row: Int, column: Int, player: Player) -> Bool {
        if board[row][column] != "" {
            return false
        }

        board[row][column] = player.mark
        return true
    }
}

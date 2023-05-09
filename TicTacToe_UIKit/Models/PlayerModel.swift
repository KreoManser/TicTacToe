enum Player {
    case x
    case o
}

extension Player {
    var mark: String {
        switch self {
        case .x:
            return "X"
        case .o:
            return "O"
        }
    }
}

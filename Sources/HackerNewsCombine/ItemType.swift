public enum ItemType: String {
    case story
    case comment
    case job
    case poll
    case pollopt
}

extension ItemType: Decodable {
}

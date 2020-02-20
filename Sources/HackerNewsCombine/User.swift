public protocol UserProtocol {
    var id: String { get }
    var about: String? { get }
}

public struct User: UserProtocol {
    public var id: String
    public var about: String?
}

extension User: Identifiable {
}

extension User: Decodable {
}

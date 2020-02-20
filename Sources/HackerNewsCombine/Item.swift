import Foundation

public protocol ItemProtocol {
    var id: Int { get }
    var deleted: Bool? { get }
    var type: ItemType? { get }
    var by: String? { get }
    var time: Date? { get }
    var text: String? { get }
    var dead: Bool? { get }
    var parent: Int? { get }
    var poll: Int? { get }
    var kids: [Int]? { get }
    var url: URL? { get }
    var score: Int? { get }
    var title: String? { get }
    var parts: [Int]? { get }
    var descendants: Int? { get }
}

public struct Item: ItemProtocol {
    public var id: Int
    public var deleted: Bool?
    public var type: ItemType?
    public var by: String?
    public var time: Date?
    public var text: String?
    public var dead: Bool?
    public var parent: Int?
    public var poll: Int?
    public var kids: [Int]?
    public var url: URL?
    public var score: Int?
    public var title: String?
    public var parts: [Int]?
    public var descendants: Int?
}

extension Item: Identifiable {
}

extension Item: Decodable {
}

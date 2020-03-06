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
    
    enum CodingKeys : CodingKey {
        case id, deleted, type, by, time, text, dead, parent, poll, kids, url, score, title, parts, descendants
    }
}

extension Item: Identifiable {
}

extension Item: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        deleted = try container.decodeIfPresent(Bool.self, forKey: .deleted)
        type = try container.decodeIfPresent(ItemType.self, forKey: .type)
        by = try container.decodeIfPresent(String.self, forKey: .by)
        time = try container.decodeIfPresent(Date.self, forKey: .time)
        text = try container.decodeIfPresent(String.self, forKey: .text)
        dead = try container.decodeIfPresent(Bool.self, forKey: .dead)
        parent = try container.decodeIfPresent(Int.self, forKey: .parent)
        poll = try container.decodeIfPresent(Int.self, forKey: .poll)
        kids = try container.decodeIfPresent([Int].self, forKey: .kids)
        url = try? container.decodeIfPresent(URL.self, forKey: .url)
        score = try container.decodeIfPresent(Int.self, forKey: .score)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        parts = try container.decodeIfPresent([Int].self, forKey: .parts)
        descendants = try container.decodeIfPresent(Int.self, forKey: .descendants)
    }
}

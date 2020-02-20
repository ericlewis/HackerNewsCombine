import Foundation
import Combine

public struct HackerNews {
    static let baseURL = URL(string: "https://hacker-news.firebaseio.com/v0/")!
    
    public struct fetchFeed: Publisher {
        public typealias Output = [Int]
        public typealias Failure = Error
        
        let type: FeedType
        let session: URLSession
        
        public init(session: URLSession = .shared, type: FeedType) {
            self.session = session
            self.type = type
        }
        
        var publisher: URLSession.DataTaskPublisher {
            session.dataTaskPublisher(for: HackerNews.baseURL.appendingPathComponent("\(type.rawValue)stories.json"))
        }
        
        public func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, Output == S.Input {
            publisher
                .parse(type: [Int].self)
                .receive(subscriber: subscriber)
        }
    }
    
    public struct fetchItem: Publisher {
        public typealias Output = Item
        public typealias Failure = Error
        
        let id: Int
        let session: URLSession
        
        public init(session: URLSession = .shared, id: Int) {
            self.session = session
            self.id = id
        }
        
        var publisher: URLSession.DataTaskPublisher {
            session.dataTaskPublisher(for: HackerNews.baseURL.appendingPathComponent("item/\(id).json"))
        }
        
        public func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, Output == S.Input {
            publisher
                .parse(type: Item.self)
                .receive(subscriber: subscriber)
        }
    }
    
    public struct fetchItems: Publisher {
        public typealias Output = [Item]
        public typealias Failure = Error
        
        let ids: [Int]
        let session: URLSession
        
        public init(session: URLSession = .shared, ids: [Int]) {
            self.session = session
            self.ids = ids
        }
        
        public func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, Output == S.Input {
            Publishers.MergeMany(ids.map { HackerNews.fetchItem(session: session, id: $0) })
                .collect()
                .receive(subscriber: subscriber)
        }
    }
    
    public struct fetchFeedItems: Publisher {
        public typealias Output = [Item]
        public typealias Failure = Error
        
        let type: FeedType
        let session: URLSession
        
        public init(session: URLSession = .shared, type: FeedType) {
            self.session = session
            self.type = type
        }
        
        public func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, Output == S.Input {
            HackerNews.fetchFeed(session: session, type: type)
                .flatMap { HackerNews.fetchItems(session: self.session, ids: $0) }
                .receive(subscriber: subscriber)
        }
    }
    
    public struct fetchUser: Publisher {
        public typealias Output = User
        public typealias Failure = Error
        
        let id: String
        let session: URLSession
        
        public init(session: URLSession = .shared, id: String) {
            self.session = session
            self.id = id
        }
        
        private var publisher: URLSession.DataTaskPublisher {
            session.dataTaskPublisher(for: HackerNews.baseURL.appendingPathComponent("user/\(id).json"))
        }
        
        public func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, Output == S.Input {
            publisher
                .parse(type: User.self)
                .receive(subscriber: subscriber)
        }
    }
}

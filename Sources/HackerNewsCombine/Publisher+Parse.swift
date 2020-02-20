import Foundation
import Combine

fileprivate let decoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    return decoder
}()

extension Publisher where Self.Output == URLSession.DataTaskPublisher.Output {
    func parse<M: Decodable>(type: M.Type) -> AnyPublisher<M, Error> {
        self.map { $0.0 }
            .decode(type: M.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}

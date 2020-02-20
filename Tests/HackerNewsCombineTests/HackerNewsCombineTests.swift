import XCTest
@testable import HackerNewsCombine

final class HackerNewsCombineTests: XCTestCase {
    func testFetchFeedItems_Top() {
        let expectation = XCTestExpectation()
        let remoteDataPublisher = HackerNews.fetchFeedItems(type: FeedType.top)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { fini in
                switch fini {
                case .finished: expectation.fulfill()
                case .failure: XCTFail()
                }
            }, receiveValue: { data in
                XCTAssertNotNil(data)
            })
        
        XCTAssertNotNil(remoteDataPublisher)
        wait(for: [expectation], timeout: 30.0)
    }
    
    func testFetchFeedItems_Ask() {
        let expectation = XCTestExpectation()
        let remoteDataPublisher = HackerNews.fetchFeedItems(type: FeedType.ask)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { fini in
                switch fini {
                case .finished: expectation.fulfill()
                case .failure: XCTFail()
                }
            }, receiveValue: { data in
                XCTAssertNotNil(data)
            })
        
        XCTAssertNotNil(remoteDataPublisher)
        wait(for: [expectation], timeout: 30.0)
    }
    
// TODO: it don't work
//    func testFetchFeedItems_New() {
//        let expectation = XCTestExpectation()
//        let remoteDataPublisher = HackerNews.fetchFeedItems(type: FeedType.new)
//            .receive(on: RunLoop.main)
//            .sink(receiveCompletion: { fini in
//                switch fini {
//                case .finished: expectation.fulfill()
//                case .failure(let e): XCTFail(e.localizedDescription)
//                }
//            }, receiveValue: { data in
//                XCTAssertNotNil(data)
//            })
//
//        XCTAssertNotNil(remoteDataPublisher)
//        wait(for: [expectation], timeout: 60.0)
//    }
    
    func testFetchFeedItems_Show() {
        let expectation = XCTestExpectation()
        let remoteDataPublisher = HackerNews.fetchFeedItems(type: FeedType.show)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { fini in
                switch fini {
                case .finished: expectation.fulfill()
                case .failure: XCTFail()
                }
            }, receiveValue: { data in
                XCTAssertNotNil(data)
            })
        
        XCTAssertNotNil(remoteDataPublisher)
        wait(for: [expectation], timeout: 30.0)
    }
    
    func testFetchFeed_New() {
        let expectation = XCTestExpectation()
        let remoteDataPublisher = HackerNews.fetchFeed(type: .new)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { fini in
                switch fini {
                case .finished: expectation.fulfill()
                case .failure: XCTFail()
                }
            }, receiveValue: { data in
                XCTAssertNotNil(data)
            })
        
        XCTAssertNotNil(remoteDataPublisher)
        wait(for: [expectation], timeout: 30.0)
    }
    
    func testFetchFeed_Show() {
        let expectation = XCTestExpectation()
        let remoteDataPublisher = HackerNews.fetchFeed(type: .show)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { fini in
                switch fini {
                case .finished: expectation.fulfill()
                case .failure: XCTFail()
                }
            }, receiveValue: { data in
                XCTAssertNotNil(data)
            })
        
        XCTAssertNotNil(remoteDataPublisher)
        wait(for: [expectation], timeout: 30.0)
    }
    
    func testFetchFeed_Top() {
        let expectation = XCTestExpectation()
        let remoteDataPublisher = HackerNews.fetchFeed(type: .top)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { fini in
                switch fini {
                case .finished: expectation.fulfill()
                case .failure: XCTFail()
                }
            }, receiveValue: { data in
                XCTAssertNotNil(data)
            })
        
        XCTAssertNotNil(remoteDataPublisher)
        wait(for: [expectation], timeout: 30.0)
    }
    
    func testFetchFeed_Ask() {
        let expectation = XCTestExpectation()
        let remoteDataPublisher = HackerNews.fetchFeed(type: .ask)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { fini in
                switch fini {
                case .finished: expectation.fulfill()
                case .failure: XCTFail()
                }
            }, receiveValue: { data in
                XCTAssertNotNil(data)
            })
        
        XCTAssertNotNil(remoteDataPublisher)
        wait(for: [expectation], timeout: 30.0)
    }
    
    func testFetchItem_Success() {
        let expectation = XCTestExpectation()
        let remoteDataPublisher = HackerNews.fetchItem(id: 1)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { fini in
                switch fini {
                case .finished: expectation.fulfill()
                case .failure: XCTFail()
                }
            }, receiveValue: { data in
                XCTAssertNotNil(data.title)
            })
        
        XCTAssertNotNil(remoteDataPublisher)
        wait(for: [expectation], timeout: 30.0)
    }
    
    func testFetchItems_Success() {
        let expectation = XCTestExpectation()
        let remoteDataPublisher = HackerNews.fetchItems(ids: [1,2,3])
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { fini in
                switch fini {
                case .finished: expectation.fulfill()
                case .failure: XCTFail()
                }
            }, receiveValue: { data in
                XCTAssertNotNil(data)
            })
        
        XCTAssertNotNil(remoteDataPublisher)
        wait(for: [expectation], timeout: 30.0)
    }
    
    func testFetchUser_Success() {
        let expectation = XCTestExpectation()
        let remoteDataPublisher = HackerNews.fetchUser(id: "pg")
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { fini in
                switch fini {
                case .finished: expectation.fulfill()
                case .failure: XCTFail()
                }
            }, receiveValue: { data in
                XCTAssertNotNil(data)
            })
        
        XCTAssertNotNil(remoteDataPublisher)
        wait(for: [expectation], timeout: 30.0)
    }
    
    func testFetchUser_Failure() {
        let expectation = XCTestExpectation()
        let remoteDataPublisher = HackerNews.fetchUser(id: "a012ff")
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { fini in
                switch fini {
                case .finished: XCTFail()
                case .failure: expectation.fulfill()
                }
            }, receiveValue: { data in
                XCTAssertNil(data)
            })
        
        XCTAssertNotNil(remoteDataPublisher)
        wait(for: [expectation], timeout: 30.0)
    }
}

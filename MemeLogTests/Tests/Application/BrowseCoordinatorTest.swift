//
//  BrowseCoordinatorTest.swift
//  MemeLogTests
//
//  Created by Miras Karazhigitov on 10.03.2022.
//

@testable import MemeLog
import XCTest

class BrowseCoordinatorTest: XCTestCase {
    var coordinator: BrowseCoordinator!
    var nc: UINavigationController!
    var flow: MockBrowseCoordinatorFlow!

    let postListLabel = "PostList"
    let postDetailLabel = "PostDetail"

    override func setUpWithError() throws {
        nc = UINavigationController()
        flow = MockBrowseCoordinatorFlow(postListLabel: postListLabel, postDetailLabel: postDetailLabel)
        coordinator = BrowseCoordinator(navigationController: nc, flow: flow)
    }

    func testViewControllersCountAfterStart() {
        // When
        coordinator.start()

        // Then
        XCTAssertEqual(nc.viewControllers.count, 1)
        XCTAssertEqual(nc.viewControllers.map { $0.accessibilityLabel }, [postListLabel])
    }

    func testViewControllersCountAfterStartAndOnSelect() {
        // When
        coordinator.start()
        flow.onSelect?(.stub1)

        // Then
        let expectation = XCTestExpectation()
        let _ = XCTWaiter.wait(for: [expectation], timeout: 1)
        XCTAssertEqual(nc.viewControllers.count, 2)
        XCTAssertEqual(nc.viewControllers.map { $0.accessibilityLabel }, [postListLabel, postDetailLabel])
    }
}


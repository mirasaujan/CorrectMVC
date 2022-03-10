//
//  FavoriteCoordinatorTest.swift
//  CorrectMVCTests
//
//  Created by Miras Karazhigitov on 10.03.2022.
//

@testable import CorrectMVC
import XCTest

class FavoriteCoordinatorTest: XCTestCase {
    var coordinator: FavoriteCoordinator!
    var nc: UINavigationController!
    var flow: MockFavoriteCoordinatorFlow!

    let postListLabel = "PostList"
    let postDetailLabel = "PostDetail"

    override func setUpWithError() throws {
        nc = UINavigationController()
        flow = MockFavoriteCoordinatorFlow(postListLabel: postListLabel, postDetailLabel: postDetailLabel)
        coordinator = FavoriteCoordinator(navigationController: nc, flow: flow)
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

//
//  MockBrowseCoordinatorFlow.swift
//  MemeLogTests
//
//  Created by Miras Karazhigitov on 10.03.2022.
//

import MemeLog
import UIKit

final class MockBrowseCoordinatorFlow: BrowseCoordinatorFlowProtocol {
    var onSelect: ((Post) -> Void)?
    let postListLabel: String
    let postDetailLabel: String

    init(postListLabel: String, postDetailLabel: String) {
        self.postListLabel = postListLabel
        self.postDetailLabel = postDetailLabel
    }

    func postListViewController(onSelect: @escaping (Post) -> Void) -> UIViewController {
        self.onSelect = onSelect
        let controller = UIViewController()
        controller.accessibilityLabel = postListLabel
        return controller
    }

    func postDetailViewController(post: Post) -> UIViewController {
        let controller = UIViewController()
        controller.accessibilityLabel = postDetailLabel
        return controller
    }
}


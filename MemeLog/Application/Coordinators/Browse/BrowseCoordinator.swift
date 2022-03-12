//
//  BrowseCoordinator.swift
//  MemeLog
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import UIKit

final class BrowseCoordinator {
    var navigationController: UINavigationController?
    private let flow: BrowseCoordinatorFlowProtocol

    init(navigationController: UINavigationController, flow: BrowseCoordinatorFlowProtocol) {
        self.navigationController = navigationController
        self.flow = flow
    }

    func start() {
        navigationController?.viewControllers = [flow.postListViewController(onSelect: { [weak self] post in
            guard let self = self else { return }
            self.navigationController?.pushViewController(self.flow.postDetailViewController(post: post), animated: true)
        })]
    }
}

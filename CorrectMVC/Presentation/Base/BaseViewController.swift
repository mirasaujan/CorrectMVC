//
//  BaseViewController.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 06.03.2022.
//

import UIKit

class BaseViewController<Model, View: UIView>: UIViewController {
    let model: Model
    let typeSafeView: View

    init(
        model: Model,
        view: View
    ) {
        self.model = model
        self.typeSafeView = view
        super.init(nibName: nil, bundle: Bundle(for: Self.self))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = typeSafeView
    }
}

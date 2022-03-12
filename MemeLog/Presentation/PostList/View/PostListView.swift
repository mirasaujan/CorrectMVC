//
//  PostListView.swift
//  MemeLog
//
//  Created by Miras Karazhigitov on 06.03.2022.
//

import UIKit

final class PostListView: BaseView {
    let collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: PostListLayout())
        return cv
    }()

    override func setup() {
        addSubview(collectionView)
        collectionView.pinToEdges()
    }
}

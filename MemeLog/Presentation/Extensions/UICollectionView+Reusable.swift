//
//  UICollectionView+Reusable.swift
//  MemeLog
//
//  Created by Miras Karazhigitov on 06.03.2022.
//

import UIKit

public extension UICollectionView {
    final func register(_ cellTypes: [UICollectionViewCell.Type]) {
        cellTypes.forEach(register)
    }

    final func register(_ cellType: UICollectionViewCell.Type) {
        if let nib = cellType.nib() {
            register(nib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
        } else {
            register(cellType, forCellWithReuseIdentifier: cellType.reuseIdentifier)
        }
    }

    final func dequeueCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError(
                "Couldn't dequeue cell with type - \(T.self) " +
                    "and reuseIdentifier \(T.reuseIdentifier). " +
                    "Make sure to register cell type"
            )
        }

        return cell
    }

    final func register(_ headerFooterViewType: UICollectionReusableView.Type) {
        if let nib = headerFooterViewType.nib() {
            register(nib,
                     forCellWithReuseIdentifier: headerFooterViewType.reuseIdentifier)
        } else {
            register(headerFooterViewType,
                     forCellWithReuseIdentifier: headerFooterViewType.reuseIdentifier)
        }
    }

    final func dequeueHeaderFooterView<T: UICollectionReusableView>(indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError(
                "Couldn't dequeue headerFooterView with type - \(T.self) " +
                    "and reuseIdentifier \(T.reuseIdentifier). " +
                    "Make sure to register headerFooterView type"
            )
        }

        return cell
    }
}

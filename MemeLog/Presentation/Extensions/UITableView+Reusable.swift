//
//  UITableView+Reusable.swift
//  MemeLog
//
//  Created by Miras Karazhigitov on 06.03.2022.
//

import UIKit

public extension UITableView {
    final func register(_ cellTypes: [UITableViewCell.Type]) {
        cellTypes.forEach(register)
    }

    final func register(_ cellType: UITableViewCell.Type) {
        if let nib = cellType.nib() {
            register(nib, forCellReuseIdentifier: cellType.reuseIdentifier)
        } else {
            register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
        }
    }

    final func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError(
                "Не удалось сделать dequeue ячейки с типом \(T.self) " +
                    "и reuseIdentifier \(T.reuseIdentifier). " +
                    "Убедитесь, что вы зарегистировали ячейку"
            )
        }
        
        return cell
    }

    final func register(_ headerFooterViewType: UITableViewHeaderFooterView.Type) {
        if let nib = headerFooterViewType.nib() {
            register(nib,
                     forHeaderFooterViewReuseIdentifier: headerFooterViewType.reuseIdentifier)
        } else {
            register(headerFooterViewType,
                     forHeaderFooterViewReuseIdentifier: headerFooterViewType.reuseIdentifier)
        }
    }

    final func dequeueHeaderFooterView<T: UITableViewHeaderFooterView>() -> T {
        guard let cell = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError(
                "Не удалось сделать dequeue headerFooterView с типом \(T.self) " +
                    "и reuseIdentifier \(T.reuseIdentifier). " +
                    "Убедитесь, что вы зарегистировали headerFooterView"
            )
        }
        
        return cell
    }
}

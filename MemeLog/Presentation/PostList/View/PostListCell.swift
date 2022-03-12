//
//  PostListCell.swift
//  MemeLog
//
//  Created by Miras Karazhigitov on 06.03.2022.
//

import UIKit
import SDWebImage

extension PostListCell {
    struct ViewModel {
        let imageURL: URL
        let title: String
    }
}

final class PostListCell: BaseCell {
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    let titleLabel: UILabel = {
        let l = UILabel()
        return l
    }()

    override func setup() {
        accessibilityLabel = "post_list_cell"
        backgroundColor = .systemBackground
        addSubview(imageView)
        imageView.pin(on: .top)
        imageView.pin(on: .bottom)
        imageView.pin(on: .leading, constant: 16)
        imageView.pinAspectRatio(1)
        imageView.pinWidth(to: 40)

        addSubview(titleLabel)
        titleLabel.pin(on: .top)
        titleLabel.pin(on: .bottom)
        titleLabel.pin(on: .trailing)
        titleLabel.pin(on: .leading, to: imageView, on: .trailing, constant: 10)
    }

    func configure(viewModel: ViewModel) {
        imageView.sd_setImage(with: viewModel.imageURL, placeholderImage: nil, options: [.progressiveLoad])
        titleLabel.text = viewModel.title
    }
}

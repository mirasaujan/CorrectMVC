//
//  PostDetailView.swift
//  MemeLog
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import UIKit
import SDWebImage

extension PostDetailView {
    struct ViewModel: Equatable {
        let imageURL: URL
        let title: String
    }
}

final class PostDetailView: BaseView {
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    let titleLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont.italicSystemFont(ofSize: 24)
        return l
    }()
    
    override func setup() {
        backgroundColor = .systemBackground
        addSubview(imageView)
        imageView.pin(on: .centerY)
        imageView.pin(on: .leading)
        imageView.pin(on: .trailing)
        imageView.pinAspectRatio(1)
        imageView.pinHeight(to: 300)

        addSubview(titleLabel)
        titleLabel.accessibilityLabel = "title_label"
        titleLabel.pin(on: .leading)
        titleLabel.pin(on: .trailing)
        titleLabel.pin(on: .top, to: imageView, on: .bottom)
    }

    func configure(viewModel: ViewModel) {
        imageView.sd_setImage(with: viewModel.imageURL, placeholderImage: nil, options: [.progressiveLoad])
        titleLabel.text = viewModel.title
    }
}

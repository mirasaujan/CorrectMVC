//
//  PostListCell.swift
//  CorrectMVC
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
        backgroundColor = .systemBackground
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(40)
        }

        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(10)
            make.top.bottom.trailing.equalToSuperview()
        }
    }

    func configure(viewModel: ViewModel) {
        imageView.sd_setImage(with: viewModel.imageURL, placeholderImage: nil, options: [.progressiveLoad])
        titleLabel.text = viewModel.title
    }
}

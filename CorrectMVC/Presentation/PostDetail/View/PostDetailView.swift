//
//  PostDetailView.swift
//  CorrectMVC
//
//  Created by Miras Karazhigitov on 07.03.2022.
//

import UIKit
import SDWebImage

extension PostDetailView {
    struct ViewModel {
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
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(400)
        }

        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom)
        }
    }

    func configure(viewModel: ViewModel) {
        imageView.sd_setImage(with: viewModel.imageURL, placeholderImage: nil, options: [.progressiveLoad])
        titleLabel.text = viewModel.title
    }
}

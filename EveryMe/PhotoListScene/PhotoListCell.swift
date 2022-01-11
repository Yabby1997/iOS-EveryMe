//
//  PhotoListCell.swift
//  EveryMe
//
//  Created by Seunghun Yang on 2022/01/09.
//

import SnapKit
import UIKit

class PhotoListCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CellReuseIdentifier"
    
    // MARK: - Subviews
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Properties
    
    var image: UIImage? {
        didSet { self.imageView.image = self.image }
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureUI()
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        self.contentView.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

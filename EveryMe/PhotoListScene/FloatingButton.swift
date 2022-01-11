//
//  FloatingButton.swift
//  EveryMe
//
//  Created by Seunghun Yang on 2022/01/11.
//

import SnapKit
import UIKit

class FloatingButton: UIButton {
    
    // MARK: - Subviews
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // MARK: - Properties
    
    var icon: UIImage? {
        didSet { self.iconImageView.image = self.icon }
    }
    
    var iconColor: UIColor? {
        didSet { self.iconImageView.tintColor = self.iconColor }
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
    
    // MARK: - Callbacks
    
    override func layoutSubviews() {
        self.layer.cornerRadius = self.frame.width / 2
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        self.backgroundColor = .white
        
        self.snp.makeConstraints { make in
            make.height.equalTo(self.snp.width)
        }
        
        self.addSubview(self.iconImageView)
        self.iconImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2.0 / 1.0)
            make.height.equalTo(self.iconImageView.snp.width)
        }
    }
}

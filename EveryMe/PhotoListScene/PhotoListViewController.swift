//
//  PhotoListViewController.swift
//  EveryMe
//
//  Created by Seunghun Yang on 2022/01/07.
//

import Combine
import UIKit

class PhotoListViewController: UIViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Int>
    typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, Int>

    enum Section {
        case photos
    }
    
    // MARK: - Subviews
    
    private lazy var photoListCollectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: self.view.frame,
            collectionViewLayout: self.photoListCollectionViewLayout
        )
        collectionView.register(PhotoListCell.self, forCellWithReuseIdentifier: PhotoListCell.reuseIdentifier)
        return collectionView
    }()
    
    private lazy var shareButton: FloatingButton = {
        let floatingButton = FloatingButton()
        floatingButton.icon = UIImage(systemName: "square.and.arrow.up")
        floatingButton.iconColor = .black
        return floatingButton
    }()
    
    private lazy var cameraButton: FloatingButton = {
        let floatingButton = FloatingButton()
        floatingButton.icon = UIImage(systemName: "camera")
        floatingButton.iconColor = .black
        return floatingButton
    }()
    
    private lazy var buttonStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.shareButton, self.cameraButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    // MARK: - Sublayers
    
    private lazy var shadowLayer: CAGradientLayer = {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0.0, 0.15]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.frame = CGRect(
            x: 0.0,
            y: 0.0,
            width: self.view.frame.size.width,
            height: self.view.frame.size.height
        )
        return gradientLayer
    }()
    
    // MARK: - Properties
    
    private lazy var photoListCollectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let width = (self.view.frame.width - 2.0) / 3.0
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        return layout
    }()
    
    private var viewModel: PhotoListViewModel!
    private var dataSource: DataSource?
    private var dataSourceSnapshot = DataSourceSnapshot()
    private var cancellables: Set<AnyCancellable> = []
    private var items = Array(1...100)
    
    // MARK: - Initializers
    
    convenience init(viewModel: PhotoListViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    deinit { self.viewModel.sceneDidDeinit() }
    
    // MARK: - Lifecycle Callbacks
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.bindUI()
        self.configureDataSource()
        self.applySnapshot(photos: self.items)
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        self.title = "EveryMe"
        
        self.view.addSubview(self.photoListCollectionView)
        self.view.layer.addSublayer(self.shadowLayer)
        
        self.view.addSubview(self.buttonStack)
        self.buttonStack.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
            make.width.equalTo(65)
        }
    }
    
    private func bindUI() {
        self.cameraButton.publisher(for: .touchUpInside)
            .sink { [weak self] _ in
                self?.viewModel.cameraButtonDidTap()
            }
            .store(in: &self.cancellables)
        
        self.shareButton.publisher(for: .touchUpInside)
            .sink { [weak self] _ in
                self?.viewModel.shareButtonDidTap()
            }
            .store(in: &self.cancellables)
    }
    
    private func configureDataSource() {
        self.dataSource = DataSource(
            collectionView: self.photoListCollectionView,
            cellProvider: { collectionView, indexPath, bool in
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: PhotoListCell.reuseIdentifier,
                    for: indexPath
                ) as? PhotoListCell else { return nil }
                
                cell.backgroundColor = .blue
                cell.image = UIImage(systemName: "heart.fill")
                return cell
            })
    }
    
    private func applySnapshot(photos: [Int], withAnimation: Bool = false) {
        self.dataSourceSnapshot = DataSourceSnapshot()
        self.dataSourceSnapshot.appendSections([Section.photos])
        self.dataSourceSnapshot.appendItems(photos)
        self.dataSource?.apply(self.dataSourceSnapshot, animatingDifferences: withAnimation)
    }
}

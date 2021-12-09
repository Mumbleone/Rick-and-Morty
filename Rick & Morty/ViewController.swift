//
//  ViewController.swift
//  Rick & Morty
//
//  Created by Adrian Devezin on 10/25/21.
//

import UIKit
import Combine

class ViewController: UIViewController, UICollectionViewDelegate {
   
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.reuseIdentifier)
        
        collectionView.collectionViewLayout = configureLayout()
        
        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        return collectionView
    }()
    
    enum Section {
          case main
      }
      
    var dataSource: UICollectionViewDiffableDataSource<Section,CharacterPresentable>!
    
    private let child = SpinnerViewController()
    private var bindings: [AnyCancellable] = []
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
        
        viewModel.$viewState.sink(receiveValue: {  viewStates in
            switch viewStates {
                
            case .loading:
                self.showLoading()
            case .characters(let viewState):
                var newSnapshot = NSDiffableDataSourceSnapshot<Section, CharacterPresentable>()
                newSnapshot.appendSections([.main])
                newSnapshot.appendItems(viewState.characters)
                self.dataSource.apply(newSnapshot)
                self.hideLoading()
            }
        }).store(in: &bindings)
      
    }
    
    private func configureLayout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(120))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, CharacterPresentable>(collectionView: self.collectionView) {
            (collectionView, indexPath, presentable) -> UICollectionViewCell? in
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell else {
                fatalError("Cannot dequeue post cell")
            }
            
            cell.setData(presentable)
            
            return cell
        }
        
        var initialSnapshot = NSDiffableDataSourceSnapshot<Section, CharacterPresentable>()
        initialSnapshot.appendSections([.main])
        initialSnapshot.appendItems([])
        
        dataSource.apply(initialSnapshot, animatingDifferences: false)
    }
}

    

extension ViewController {
    
    private func showLoading() {
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    private func hideLoading() {
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
}

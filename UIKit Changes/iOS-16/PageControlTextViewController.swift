//
//  PageControlTextViewController.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 17.02.2024.
//

import UIKit

@available(iOS 16, *)
class PageControlTextViewController: UIViewController {
    
    @IBOutlet weak var exampleTextView: UITextView!
    @IBOutlet weak var bannerCollection: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var layout: UICollectionViewFlowLayout?
    
    var collectionDirection: UICollectionView.ScrollDirection = .horizontal
    var pageDirection: UIPageControl.Direction = .leftToRight
    
    let banners: [UIImage] = [.rainingBanner, .sunnyBanner, .thunderBanner]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextView()
        configureCollectionView()
        configurePageControl()
    }
    
    private func configureTextView() {
        exampleTextView.isFindInteractionEnabled = true
        exampleTextView.isEditable = false
        
        exampleTextView.text = "In the heart of an ancient forest, where sunlight barely touched the ground, there lived a small but brave rabbit. Despite the dangers lurking in the shadows, the rabbit had a dream: to see the world beyond the towering trees. Each day, it ventured a little further, dodging predators and overcoming obstacles. One day, amidst the dense foliage, it found a clearing bathed in sunlight. Here, a myriad of flowers bloomed, and the rabbit realized the beauty of its home. It learned that bravery isn't just about venturing into the unknown, but also seeing the wonder in the familiar."
    }
    
    private func configureCollectionView() {
        layout = UICollectionViewFlowLayout()
        guard let layout else { return }
        layout.scrollDirection = collectionDirection
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        bannerCollection.setCollectionViewLayout(layout, animated: true)
        bannerCollection.register(
            WeatherBannerCollectionViewCell.self,
            forCellWithReuseIdentifier: WeatherBannerCollectionViewCell.cellIdentifier
        )
        bannerCollection.isPagingEnabled = true
        bannerCollection.delegate = self
        bannerCollection.dataSource = self
        bannerCollection.layer.masksToBounds = true
    }
    
    private func configurePageControl() {
        pageControl.numberOfPages = banners.count
        pageControl.currentPage = 0
        pageControl.direction = pageDirection
        pageControl.layer.cornerRadius = 8
        pageControl.layer.masksToBounds = true
        pageControl.backgroundStyle = .prominent
        pageControl.backgroundColor = .lightGray
    }
    
    @IBAction func indexChanged(_ sender: UIPageControl) {
        let indexPath = IndexPath(item: sender.currentPage, section: 0)
        bannerCollection.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func changeLayout(_ sender: UIButton) {
        
        collectionDirection = (collectionDirection == .horizontal) ? .vertical : .horizontal
        
        layout?.scrollDirection = collectionDirection
        
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            guard let self else { return }
            self.pageControl.alpha = 0
        }, completion: { [weak self] _ in
            guard let self else { return }
            self.pageDirection = (self.pageDirection == .leftToRight) ? .topToBottom : .leftToRight
            self.pageControl.direction = self.pageDirection
            
            UIView.animate(withDuration: 0.25) { [weak self] in
                guard let self else { return }
                self.pageControl.alpha = 1
            }
        })
    }
    
}

@available(iOS 16, *)
extension PageControlTextViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.frame.size
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
}

@available(iOS 16, *)
extension PageControlTextViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let bannerImage = banners[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherBannerCollectionViewCell.cellIdentifier, for: indexPath) as? WeatherBannerCollectionViewCell else { return .init() }
        cell.bannerImageView.image = bannerImage
        cell.bannerImageView.clipsToBounds = true
        cell.bannerImageView.layer.cornerRadius = 10
        return cell
    }
}

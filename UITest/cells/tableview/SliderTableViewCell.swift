//
//  SliderTableViewCell.swift
//  UITest
//
//  Created by AyeSuNaing on 13/11/2023.
//

import UIKit

class SliderTableViewCell: UITableViewCell {
    
    var upcommings : [UpComming] = []
    @IBOutlet weak var indicator: UIPageControl!
    @IBOutlet weak var collectinView: UICollectionView!
    
    var timer = Timer()
    var counter = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectinView.delegate = self
        collectinView.dataSource = self
        collectinView.register(UINib(nibName: SliderCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SliderCollectionViewCell.identifier)
    }
    func setSlider(upcommingList : [UpComming]) {
        upcommings = upcommingList
        indicator.numberOfPages = upcommings.count
        indicator.currentPage = 0
        indicator.currentPageIndicatorTintColor = .red
        indicator.pageIndicatorTintColor = .gray
        
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        
    }
    
    
    @objc func changeImage() {
        
        if counter < upcommings.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.collectinView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            indicator.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.collectinView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            counter = 1
        }
        
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension SliderTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upcommings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SliderCollectionViewCell.identifier, for: indexPath) as? SliderCollectionViewCell else { return UICollectionViewCell() }
        if let image = UIImage(named: upcommings[indexPath.row].image) {
            cell.imageView.image = image
        }
        cell.titleLbl.text = upcommings[indexPath.row].title
        
        return cell
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth : CGFloat = ( UIScreen.main.bounds.width  )
        return CGSize(width: itemWidth , height: 180)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        indicator.currentPage = indexPath.row
    }
    
    
}



//
//  CollectionTableViewCell.swift
//  UITest
//
//  Created by AyeSuNaing on 13/11/2023.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {
    
    let CATEGORY : String = "CATEGORY"
    let ACTIVITY : String = "ACTIVITY"
    let UPCOMMING : String = "UPCOMMING"
    let SLIDER : String = "SLIDER"
    
    @IBOutlet weak var indicator: UIPageControl!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var bgShadowView: UIView!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var collectionViewHeightconstraint: NSLayoutConstraint!
    var categories : [Category] = []
    var activities : [Activity] = []
    var upcommings : [UpComming] = []
    
    var timer = Timer()
    var counter = 0
    var cellCount : Int = 0
    var cellType : String?
    
    @IBOutlet weak var delegate : ClickedDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.register(UINib(nibName: ActivityCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ActivityCollectionViewCell.identifier)
        collectionView.register(UINib(nibName: UpCommingCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: UpCommingCollectionViewCell.identifier)
        collectionView.register(UINib(nibName: SliderCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SliderCollectionViewCell.identifier)
        
    }
    
    func setCategory (categoryList : [Category]) {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0)
        }
        headerView.isHidden = true
        headerViewConstraint.constant =  0
        categories = categoryList
        cellType = CATEGORY
        cellCount = categoryList.count
        bgShadowView.isHidden = true
        mainView.backgroundColor = UIColor.systemBackground
        indicator.isHidden = true
        
        let itemWidth: CGFloat = (UIScreen.main.bounds.width - 70) * 0.25
        let numberOfItemsInRow: Int = 4
        let numberOfRows: Int = Int(ceil(Double(categoryList.count) / Double(numberOfItemsInRow)))
        
        let collectionViewHeight: CGFloat = CGFloat(itemWidth * CGFloat(numberOfRows))
        
        collectionViewHeightconstraint.constant = collectionViewHeight + 70
        
    }
    func setActivity (activityList : [Activity]) {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0)
        }
        headerView.isHidden = true
        headerViewConstraint.constant =  0
        activities = activityList
        cellType = ACTIVITY
        cellCount = activityList.count
        bgShadowView.isHidden = false
        bgShadowView.backgroundColor = UIColor.systemGray5
        collectionView.backgroundColor = UIColor.clear
        mainView.backgroundColor = UIColor.systemBackground
        collectionViewHeightconstraint.constant = 200
        indicator.isHidden = true
    }
    
    
    func setUpcomming(upcommingList : [UpComming]) {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0)
        }
        headerView.isHidden = false
        headerViewConstraint.constant =  50
        upcommings = upcommingList
        cellType = UPCOMMING
        cellCount = upcommingList.count
        bgShadowView.isHidden = false
        mainView.backgroundColor = UIColor.systemGray5
        collectionView.backgroundColor = UIColor.clear
        collectionViewHeightconstraint.constant = 230
        indicator.isHidden = true
    }
    
    func setSlider(upcommingList : [UpComming]) {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        }
        
        headerView.isHidden = true
        headerViewConstraint.constant =  0
        upcommings = upcommingList
        cellType = SLIDER
        cellCount = upcommingList.count
        bgShadowView.isHidden = true
        mainView.backgroundColor = UIColor.clear
        collectionView.backgroundColor = UIColor.systemBackground
        collectionViewHeightconstraint.constant = 200
        
        indicator.isHidden = false
        
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
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            indicator.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            counter = 1
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


extension CollectionTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if cellType == CATEGORY  {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
            if let image = UIImage(named: categories[indexPath.row].image) {
                cell.catImg.image = image
            }
            cell.catTitle.text = categories[indexPath.row].name
            return cell
        } else if cellType == ACTIVITY  {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActivityCollectionViewCell.identifier, for: indexPath) as? ActivityCollectionViewCell else { return UICollectionViewCell() }
            if let image = UIImage(named: activities[indexPath.row].image) {
                cell.img.image = image
            }
            cell.titlelbl.text = activities[indexPath.row].title
            cell.textLbl.text = activities[indexPath.row].text
            cell.actionLbl.text = activities[indexPath.row].actin
            if activities[indexPath.row].textColor {
                cell.textLbl.textColor = #colorLiteral(red: 0.3294117647, green: 0.3294117647, blue: 0.3294117647, alpha: 1)
            } else {
                cell.textLbl.textColor = #colorLiteral(red: 0.7215686275, green: 0.7215686275, blue: 0.7215686275, alpha: 1)
            }
            return cell
        } else if cellType == UPCOMMING  {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpCommingCollectionViewCell.identifier, for: indexPath) as? UpCommingCollectionViewCell else { return UICollectionViewCell() }
            if let image = UIImage(named: upcommings[indexPath.row].image) {
                cell.img.image = image
            }
            cell.titleLbl.text = upcommings[indexPath.row].title
            cell.timeLbl.text = upcommings[indexPath.row].time
            
            return cell
        } else if cellType == SLIDER  {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SliderCollectionViewCell.identifier, for: indexPath) as? SliderCollectionViewCell else { return UICollectionViewCell() }
            if let image = UIImage(named: upcommings[indexPath.row].image) {
                cell.imageView.image = image
            }
            cell.titleLbl.text = upcommings[indexPath.row].title
            
            return cell
        }  else {
            return UICollectionViewCell()
        }
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if cellType == CATEGORY  {
            let itemWidth : CGFloat = ( UIScreen.main.bounds.width - 70 )  * 0.25
            return CGSize(width: itemWidth, height: (itemWidth + 30))
        } else if cellType == ACTIVITY  {
            let itemWidth : CGFloat = ( UIScreen.main.bounds.width  )  * 0.5
            return CGSize(width: itemWidth - 20 , height: 180)
        } else if cellType == UPCOMMING  {
            let itemWidth : CGFloat = ( UIScreen.main.bounds.width  )  * 0.7
            return CGSize(width: itemWidth , height: 180)
        } else if cellType == SLIDER  {
            let itemWidth : CGFloat = ( UIScreen.main.bounds.width  )
            return CGSize(width: itemWidth , height: 180)
        }  else {
            return CGSize()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.clickedItem()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        indicator.currentPage = indexPath.row
    }
    
    
}



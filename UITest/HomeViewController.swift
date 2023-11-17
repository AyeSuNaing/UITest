//
//  HomeViewController.swift
//  UITest
//
//  Created by AyeSuNaing on 13/11/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    var categories : [Category] = []
    var activies : [Activity] = []
    var upcommings : [UpComming] = []

    @IBOutlet weak var tableView: UITableView!
    
    var sectionsList : [HomeSections] = HomeSections.allCases
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: CollectionTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CollectionTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        getCatgory()
        getActivities()
        getUpcommings ()
    }
    
    func getUpcommings () {
        
        let upComming1 = UpComming(title: "S.E.A. Aquarium Daily Shows | Tickikids Singapore", image: "up1", time: "12:00 PM")
        let upComming2 = UpComming(title: "Exciting adventures at the Two Oceans Aquarium", image: "up2", time: "2:30 PM")
        let upComming3 = UpComming(title: "Diver with Green Sea Turtle", image: "up3", time: "3:30 PM")
        upcommings = [upComming1, upComming2, upComming3]
        tableView.reloadData()
    }
    
    func getActivities () {
        
        let activity1 = Activity(title: "MMy e-tickets", image: "eticket", text: "There aren't any yet.", actin: "Retrieve", textColor: false)
        let activity2 = Activity(title: "Park hours", image: "hour", text: "Today, 13 Feb 10am - 5pm", actin: "Plan my visit", textColor: true)

        activies = [activity1, activity2]

    }
    
    func getCatgory(){
        
        let catNameList = ["Map","Inhabitant", "Shows", "Shopping", "Dine", "Meet & Greets"]
        let catImageList = ["cat1","cat2", "cat3", "cat4", "cat5", "cat6"]
        guard catNameList.count == catImageList.count else {
            fatalError("The count of catNameList and catImageList must be the same.")
        }
        for i in 0..<catNameList.count {
            let category = Category(name: catNameList[i], image: catImageList[i])
            categories.append(category)
        }
    }

}

extension HomeViewController : ClickedDelegate {
    func clickedItem() {
        let vc = self.navigateToDetailViewController()
        self.present(vc, animated: true, completion: nil)
    }
    
    
}


extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection = sectionsList[section]
        
        switch currentSection {
        
        case .SLIDER:
            return 1
        case .CATEGORY:
            return 1
        case .ACTIVITY:
            return 1
        case .UPCOMMING_SHOW:
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if indexPath.row == 0 {
//            self.activityIndicator.isHidden = true
//        }
        
        
        
        
        let section = sectionsList[indexPath.section]
        switch section {
        case .SLIDER:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier) as? CollectionTableViewCell else { return UITableViewCell() }
            cell.setSlider(upcommingList: upcommings)
            cell.delegate = self
            return cell
        case .CATEGORY:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier) as? CollectionTableViewCell else { return UITableViewCell() }
            cell.setCategory(categoryList: categories)
            cell.delegate = self
            return cell
        
        case .ACTIVITY:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier) as? CollectionTableViewCell else { return UITableViewCell() }
            cell.setActivity(activityList: activies)
            cell.delegate = self
            return cell
        case .UPCOMMING_SHOW:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier) as? CollectionTableViewCell else { return UITableViewCell() }
            cell.setUpcomming(upcommingList: upcommings)
            cell.delegate = self
            return cell
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let section = sectionsList[indexPath.section]
        switch section {
        case .SLIDER:
            print("clicked")
        case .CATEGORY:
            print("clicked")
        case .ACTIVITY:
            print("clicked")
        case .UPCOMMING_SHOW:
            print("clicked")
        }
    }
    
    
    
}

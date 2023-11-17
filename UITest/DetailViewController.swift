//
//  DetailViewController.swift
//  UITest
//
//  Created by AyeSuNaing on 13/11/2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var upcommings : [UpComming] = []
    @IBOutlet weak var closeImg: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var sectionsList : [DetailSections] = DetailSections.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: SliderTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: SliderTableViewCell.identifier)
        tableView.register(UINib(nibName: DetailTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DetailTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        getUpcommings ()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(clickedBack))
        closeImg.isUserInteractionEnabled = true
        closeImg.addGestureRecognizer(tapGesture)
        
    }
    @objc func clickedBack(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func getUpcommings () {
        let upComming1 = UpComming(title: "S.E.A. Aquarium Daily Shows | Tickikids Singapore", image: "up1", time: "12:00 PM")
        let upComming2 = UpComming(title: "Exciting adventures at the Two Oceans Aquarium", image: "up2", time: "2:30 PM")
        let upComming3 = UpComming(title: "Diver with Green Sea Turtle", image: "up3", time: "3:30 PM")
        upcommings = [upComming1, upComming2, upComming3]
        tableView.reloadData()
    }
    
}



extension DetailViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection = sectionsList[section]
        
        switch currentSection {
        
        case .SLIDER:
            return 1
        case .DETAIL:
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let section = sectionsList[indexPath.section]
        switch section {
        case .SLIDER:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SliderTableViewCell.identifier) as? SliderTableViewCell else { return UITableViewCell() }
            cell.setSlider(upcommingList: upcommings)
            return cell
        case .DETAIL:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier) as? DetailTableViewCell else { return UITableViewCell() }
            return cell
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let section = sectionsList[indexPath.section]
        switch section {
        case .SLIDER:
            print("clicked")
        case .DETAIL:
            print("clicked")
        }
    }
    
    
    
}

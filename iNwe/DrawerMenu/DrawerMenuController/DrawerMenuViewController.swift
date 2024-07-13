//
//  DrawerMenuViewController.swift
//  iNwe
//
//  Created by Rakib Hasan on 10/7/24.
//

import UIKit

class DrawerMenuViewController: UIViewController {
    let transitionManager = DrawerTransitionManager()
    var delegate: DrawerMenuDelegate?
    var iconNameList: [String] = ["Home", "Profile", "Account","Notification","Friend","Explore","Story","Game List","Share App","Logout"]
    @IBOutlet weak var tableView: UITableView!
    
    init() {
        super.init(nibName: nil, bundle: nil)
      
        modalPresentationStyle = .custom
        transitioningDelegate = transitionManager
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(dismissPresentedController))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        tableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        tableView.backgroundColor = UIColor.clear
        tableView.separatorColor = .clear

    }
    
    @objc private func dismissPresentedController() {
        delegate?.respondToSwipeGesture()
    }
}

protocol DrawerMenuDelegate {
    func respondToSwipeGesture()
}


extension DrawerMenuViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in your table view
        return iconNameList.count // Replace with your actual data source
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        if indexPath.row == 0 {
            cell.holderView.backgroundColor = UIColor(red: 15.0/255.0, green: 41.0/255.0, blue: 64.0/255.0, alpha: 1.0)
            cell.lbl.textColor = UIColor.white
            let image = UIImage(named:  iconNameList[indexPath.row])?.withRenderingMode(.alwaysTemplate)
            cell.imv.image = image
            cell.imv.tintColor =  UIColor.white
        }
        else {
            cell.holderView.backgroundColor =  UIColor(red: 21.0/255.0, green: 48.0/255.0, blue: 72.0/255.0, alpha: 1.0)
            cell.lbl.textColor = UIColor(red: 104.0/255.0, green: 126.0/255.0, blue: 147.0/255.0, alpha: 1.0)
            let image = UIImage(named:  iconNameList[indexPath.row])?.withRenderingMode(.alwaysTemplate)
            cell.imv.image = image
            cell.imv.tintColor =  UIColor(red: 104.0/255.0, green: 126.0/255.0, blue: 147.0/255.0, alpha: 1.0)
        }
        
      
        // Configure your cell
        cell.lbl.text = iconNameList[indexPath.row]
       
       
        
        return cell
    }
}

extension DrawerMenuViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Return the height for each cell
        return 60 // Replace with your desired row height
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle row selection
        print("Selected row \(indexPath.row)")
        self.dismissPresentedController()
    }

    // Add more UITableViewDelegate methods as needed
}

//
//  HomeVc.swift
//  iNwe
//
//  Created by Sadiqul Amin on 9/7/24.
//

import UIKit


protocol ViewControllerBDelegate: AnyObject {
    func  addView()
}

class HomeVc: UIView {
    var delegate1: ViewControllerBDelegate?
    var itemName: [String] = ["Alerts", "Email","Friends","Current Chat room","Recent","Online","Offline"]
    var flagValue: [Int] = [0,0,0,0]
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var profileHolderView: UIView!
    @IBOutlet weak var statusMessage: UIView!
    @IBOutlet weak var alarmHolderView: UIView!
    
    @IBAction func drawSideMenu(_ sender: UIButton) {
        
    }
    
    @IBAction func addView(_ sender: Any) {
        delegate1?.addView()
    }
    
    override func draw(_ rect: CGRect) {
        profileHolderView.layer.cornerRadius = 10.0
        if #available(iOS 15.0, *) {
            self.tableview.sectionHeaderTopPadding = 0
        }
        else {
            // it will fix from properties of table view
        }
        statusMessage.layer.cornerRadius = 10.0
        statusMessage.clipsToBounds = true
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "HomeCell")
        tableview.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
        
    }
    
    public  func reloadData() {
        
        tableview.reloadData()
    }
    
    @IBAction func onclickLink(_ sender: UITapGestureRecognizer) {
        
    
        let index = (sender.view?.tag ?? 0) - 100
        
        if index > 2 {
            var test =  index - 3
            
            let v = flagValue[test]
            if v == 0 {
                flagValue[test] = 1
            }
            else {
                flagValue[test] = 0
            }
            
            print("i have changed indexset \(test)")
            
           
            tableview.reloadData()
           
            
        }
        
        print("index i found \(index)")
        
    }
}


extension HomeVc: UITableViewDataSource,UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as? HomeCell
        cell?.title.text = itemName[section]
        cell?.imv.image = UIImage(named: itemName[section])
        if section > 2 {
            cell?.imv.isHidden = true
            cell?.widthForImv.constant  = 0
        }
        else {
            cell?.imv.isHidden = false
            cell?.widthForImv.constant  = 35
        }
        if section == 2 {
            cell?.resetImv.isHidden =  false
            cell?.searchImv.isHidden = false
        }
        else {
            cell?.resetImv.isHidden =  true
            cell?.searchImv.isHidden = true
        }
        
        
        if section > 2 {
            
            cell?.resetImv.isHidden =  false
            cell?.resetImv.image = UIImage(named: "Down")
            
            var test =  section - 3
            let v = flagValue[test]
            if v == 0 {
                cell?.resetImv.image = UIImage(named: "Down")
            }
            else {
                cell?.resetImv.image = UIImage(named: "Up")
            }
            
        }
        else {
            
            if section == 2 {
                cell?.resetImv.image = UIImage(named: "reset")
            }
        }
        if section  == 0 {
            cell?.contentView.backgroundColor = UIColor(red: 252.0/255.0, green: 227.0/255.0, blue: 226.0/255.0, alpha: 1.0)
        }
        else {
            cell?.contentView.backgroundColor = UIColor.white
        }
        
        cell?.resetImv.tag =  100 + section
        
        let tap = UITapGestureRecognizer(target: self, action:#selector(self.onclickLink(_:)))
        tap.numberOfTapsRequired = 1
        
        cell?.resetImv.isUserInteractionEnabled = true
        cell?.resetImv.addGestureRecognizer(tap)
        
        
        
        return cell
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return itemName.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFLOAT_MIN
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section < 3 {
            return  0
        }
        else {
            var test =  section - 3
            let v = flagValue[test]
            if v == 1 {
                return 10
            }
            else {
                return 0
            }
            
        }
        // Return the number of rows in your table view
       // Replace with your actual data source
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Return the height for each cell
        return 60 // Replace with your desired row height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}




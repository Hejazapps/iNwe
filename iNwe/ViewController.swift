//
//  ViewController.swift
//  iNwe
//
//  Created by Sadiqul Amin on 9/7/24.
//

import UIKit

class ViewController: UIViewController, ViewControllerBDelegate,UIScrollViewDelegate {
    
    var delegate: HomeVCDelegate?
    var numberOfViews = 1
    var shouldScroll = false
    var totalWidth:CGFloat = 0
    
    @IBOutlet weak var holderView: UIView!
    
    @IBOutlet weak var topLabel: UILabel!
    var previousValue:UIImageView?
    var contentOffSetInset = [String: Int]()

    func addView() {
        
        if shouldScroll {
            return
        }
        self.addNewitem()
        
        shouldScroll = true
        
        let view = UILabel(frame: CGRect(x: CGFloat(numberOfViews) * screenSize.width, y: 10, width: screenSize.width, height:screenSize.height - 170))
        view.backgroundColor = randomColor()
        scrollView.addSubview(view)
        
        view.text = "\(numberOfViews)"
        view.font = UIFont.systemFont(ofSize: 100)
        view.textAlignment = .center
        
        scrollView.contentSize = CGSize(width: screenSize.width + scrollView.contentSize.width, height: screenSize.height - 170)
        numberOfViews += 1
        self.perform(#selector(self.targetMethod1), with: self, afterDelay: 0.1)
        
    }
    
    @objc func buttonAction(sender: UIButton!) {
        
        
        
        
    }
    func addNewitem() {
        
        
        for i in 1...self.numberOfViews {
            
            if let viewWithTag = self.scrollView1.viewWithTag(100 + Int(i)) {
                
                viewWithTag.backgroundColor = UIColor.clear
            }
        }
        print("number of views i find \(numberOfViews)")
        
        var imageView : UIImageView
        imageView  = UIImageView(frame:CGRectMake(CGFloat(CGFloat(numberOfViews) * holderView.frame.size.height ), 0, holderView.frame.size.height, holderView.frame.size.height));
        imageView.image = UIImage(named:"Chat")
        imageView.backgroundColor = UIColor.blue
        
        
        var temp : UIView
        temp  = UIView(frame:CGRectMake(holderView.frame.size.height - 1 + imageView.frame.origin.x, 0, 1, holderView.frame.size.height));
        temp.backgroundColor = UIColor(red: 45.0/255.0, green: 92.0/255.0, blue: 133.0/255.0, alpha: 1.0)
        scrollView1.addSubview(imageView)
        imageView.tag = 100 + numberOfViews
        //imageView.backgroundColor = UIColor.red
        scrollView1.addSubview(temp)
        
        scrollView1.contentSize = CGSize(width: CGFloat(CGFloat(numberOfViews) * holderView.frame.size.height + holderView.frame.size.height ), height: holderView.frame.size.height)
        
        
         
        
        
        let tap = UITapGestureRecognizer(target: self, action:#selector(self.onclickLink(_:)))
        tap.numberOfTapsRequired = 1
        
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
        
        
    }
    
    @objc fileprivate func targetMethod1(){
        scrollView.layer.removeAllAnimations()
        
        var getNumberOfitems = (self.scrollView.contentSize.width - self.scrollView.contentOffset.x)
        getNumberOfitems = getNumberOfitems / self.screenSize.width
        
      
        
        let targetOffset = CGPoint(x: scrollView.contentSize.width - screenSize.width, y: 0)
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.2 * getNumberOfitems, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
                self.scrollView.contentOffset.x = self.scrollView.contentSize.width - self.screenSize.width
                
                if (self.scrollView1.contentSize.width -  self.holderView.frame.width > 0) {
                    self.scrollView1.contentOffset.x = self.scrollView1.contentSize.width -  self.holderView.frame.width + 10
                }
                
                let value = Double(self.scrollView.contentOffset.x / self.screenSize.width)
                let flooredValue = floor(value)
                
                print("hey have you contentoffst \(self.scrollView1.contentOffset.x) \(flooredValue)")
                
            }, completion:{_ in
                self.updateAll()
                self.shouldScroll = false
                
                
            })
        }
        
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("end scroll")
    }
    
    @IBAction func gotoaDD(_ sender: Any) {
        self.addView()
    }
    
    func randomColor() -> UIColor {
        // Generate random values for RGB components
        let red = CGFloat.random(in: 0.0 ... 1.0)
        let green = CGFloat.random(in: 0.0 ... 1.0)
        let blue = CGFloat.random(in: 0.0 ... 1.0)
        
        // Create UIColor object with the generated random RGB values
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
        return color
    }
    
    
    var homeVc:HomeVc! = nil
    var view1:TempView! = nil
    var view2:TempView! = nil
    var view3:TempView! = nil
    var view4:TempView! = nil
    var view5:TempView! = nil
    var view6:TempView! = nil
    var view7:TempView! = nil
    var view8:TempView! = nil
    var view9:TempView! = nil
    var view10:TempView! = nil
    var view11:TempView! = nil
    var view12:TempView! = nil
    var view13:TempView! = nil
    var view14:TempView! = nil
    var view15:TempView! = nil
    var view16:TempView! = nil
    
    
    var scrollView: UIScrollView!
    var scrollView1: UIScrollView!
    let screenSize: CGRect = UIScreen.main.bounds
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.perform(#selector(self.targetMethod), with: self, afterDelay: 0.1)
        
        
    }
    
    
    func updateAll() {
        
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//            
//            
//            print("this is the thing i want \(self.scrollView.contentOffset.x / self.screenSize.width)")
//            let value = Double(self.scrollView.contentOffset.x / self.screenSize.width)
//            let flooredValue = floor(value)
//            
//           
//            
//            
//            
//            print("scrol value i find \(flooredValue)")
//            
//            
//        }
        
    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView) {
        
       
    }
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        debugPrint("scrollViewWillBeginDecelerating")
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        self.updateAll()
        debugPrint("scrollViewDidScroll")
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        debugPrint("scrollViewWillBeginDragging")
    }
    func updateM(){
        
        for i in 1...self.numberOfViews {
            
            if let viewWithTag = self.scrollView1.viewWithTag(100 + Int(i)) {
                
                viewWithTag.backgroundColor = UIColor.clear
            }
        }
      
        var flooredValue = Double(self.scrollView.contentOffset.x / self.screenSize.width)
        var temp = flooredValue
        let ceilValue:CGFloat = CGFloat(Int(flooredValue))
        
        var diff = ceilValue - flooredValue
        if diff < 0 {
            diff  = diff * (-1)
        }
        diff  = diff * 100
        
        if (diff > 80) {
            flooredValue = ceil(flooredValue)
        }
        else {
            flooredValue = floor(flooredValue)
        }
        
       
     
        
       
        if flooredValue > 0 {
            
            if let viewWithTag = self.scrollView1.viewWithTag(100 + Int(flooredValue)) {
                
                viewWithTag.backgroundColor = UIColor.blue
            }
        }
        
        
        var newValue = flooredValue * holderView.frame.height
        
        var threshold = (self.holderView.frame.width / holderView.frame.height)
       
        flooredValue = flooredValue + 1
      
        var temp1 = (flooredValue - threshold)*60
        
      
        
        
        print("hey have you \(flooredValue) \(threshold) \(temp1)")
        
        if flooredValue < threshold {
            scrollView1.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }
        else {
            scrollView1.setContentOffset(CGPoint(x: temp1 + 8, y: 0), animated: true)
        }
        
       
        
       
        
        
        
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
       
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.updateM()
        }
        
    }
    func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        debugPrint("scrollViewDidChangeAdjustedContentInset")
    }
    
    func initateScroll() {
        
        homeVc = HomeVc.fromNib()
        scrollView1 = UIScrollView()
        homeVc.delegate1 = self
        scrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 170, width: screenSize.width, height: screenSize.height - 170)
        homeVc.frame = CGRect(x: 0, y: 10, width: screenSize.width, height: screenSize.height - 170)
        scrollView.addSubview(homeVc)
        scrollView.contentSize = CGSize(width: screenSize.width, height: screenSize.height - 170)
        scrollView.isPagingEnabled = true
        scrollView.backgroundColor = UIColor.white
        scrollView.delegate = self
        if #available(iOS 17.4, *) {
            scrollView.bouncesVertically =  false
            scrollView.bouncesHorizontally =  false
        } else {
            // Fallback on earlier versions
        }
        
        scrollView1.frame = CGRect(x: 0, y: 0, width: holderView.frame.size.width, height: holderView.frame.size.height)
        holderView.addSubview(scrollView1)
        
        
        var imageView : UIImageView
        imageView  = UIImageView(frame:CGRectMake(0, 0, holderView.frame.size.height, holderView.frame.size.height));
        imageView.image = UIImage(named:"Home")
        imageView.tag = 100
        //imageView.backgroundColor = UIColor.red
        
        
        var temp : UIView
        temp  = UIView(frame:CGRectMake(holderView.frame.size.height - 1 + imageView.frame.origin.x, 0, 1, holderView.frame.size.height));
        temp.backgroundColor = UIColor(red: 45.0/255.0, green: 92.0/255.0, blue: 133.0/255.0, alpha: 1.0)
        scrollView1.addSubview(imageView)
        scrollView1.addSubview(temp)
        
        scrollView1.contentSize = CGSize(width: 100, height: holderView.frame.size.height)
        
        
        let tap = UITapGestureRecognizer(target: self, action:#selector(self.onclickLink(_:)))
        tap.numberOfTapsRequired = 1
        
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
        
        
        self.view.addSubview(scrollView)
       
        
    }
    
    @IBAction func onclickLink(_ sender: UITapGestureRecognizer) {
        
       
        
        for i in 1...self.numberOfViews {
            
            if let viewWithTag = self.scrollView1.viewWithTag(100 + Int(i)) {
                
                viewWithTag.backgroundColor = UIColor.clear
            }
        }
        
        let index = (sender.view?.tag ?? 0) - 100
        
        if index > 0 {
            
            if let viewWithTag = self.scrollView1.viewWithTag(100 + Int(index)) {
                
                viewWithTag.backgroundColor = UIColor.blue
            }
        }
        
        print("hey have you contentoffst \(index)")
        
        
        var getNumberOfitems = (self.scrollView.contentOffset.x -  CGFloat((index + 1)) * screenSize.width)
        getNumberOfitems = getNumberOfitems / self.screenSize.width
        
        getNumberOfitems = abs(getNumberOfitems)
        
        print("it is needed \(getNumberOfitems) \(index)")
        
        let targetOffset = CGPoint(x: scrollView.contentSize.width - screenSize.width, y: 0)
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.2 * getNumberOfitems, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
                self.scrollView.contentOffset.x =  CGFloat(index) * self.screenSize.width
            }, completion:{_ in
                self.updateAll()
                self.shouldScroll = false
                
                
            })
        }
        
    }
    
    @objc fileprivate func targetMethod(){
        self.initateScroll()
        
    }
    
    @IBAction func drawSideMenu(_ sender: UIButton) {
        
        let drawerMenu = DrawerMenuViewController()
        drawerMenu.delegate = self
        present(drawerMenu, animated: true)
    }
    
    
}

extension ViewController: HomeVCDelegate, DrawerMenuDelegate {
    func menuButtonTapped() {
        let drawerMenu = DrawerMenuViewController()
        drawerMenu.delegate = self
        present(drawerMenu, animated: true)
    }
    
    func respondToSwipeGesture() {
        dismiss(animated: true)
    }
}



extension UIView {
    class func fromNib(named: String? = nil) -> Self {
        let name = named ?? "\(Self.self)"
        guard
            let nib = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        else { fatalError("missing expected nib named: \(name)") }
        guard
            /// we're using `first` here because compact map chokes compiler on
            /// optimized release, so you can't use two views in one nib if you wanted to
            /// and are now looking at this
            let view = nib.first as? Self
        else { fatalError("view of type \(Self.self) not found in \(nib)") }
        return view
    }
}

protocol HomeVCDelegate {
    func menuButtonTapped()
}

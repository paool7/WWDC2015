//
//  AppCollection.swift
//  Paul Dippold
//
//  Created by Paul Dippold on 4/25/15.
//  Copyright (c) 2015 Paul Dippold. All rights reserved.
//

import UIKit


class AppCollection: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet var desctext: UITextView!
    @IBOutlet var appimage: UIImageView!
    @IBOutlet var closeb: UIButton!
    @IBOutlet var collector: UICollectionView!
    @IBOutlet var infoview: UIView!
    var url = ""
    @IBOutlet var openb: UIButton!
    enum UIUserInterfaceIdiom : Int
    {
        case Unspecified
        case Phone
        case Pad
    }
    
    struct ScreenSize
    {
        static let screenwidth = UIScreen.mainScreen().bounds.size.width
        static let screenheight = UIScreen.mainScreen().bounds.size.height
        static let screenmax = max(ScreenSize.screenwidth, ScreenSize.screenheight)
    }
    
    struct DeviceType
    {
        static let i4s = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.screenmax < 568
        static let i5 = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.screenmax == 568
        static let i6 = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.screenmax == 667
        static let i6plus = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.screenmax == 736
        static let ipad = UIDevice.currentDevice().userInterfaceIdiom == .Pad && ScreenSize.screenmax == 1024
    }
     var images: [String] = ["celllogo.png", "crowdlogo.png","daleklogo.png", "holdlogo.png","triplogo.png"]
    var labels: [String] = ["Cell Laws","CrowdFindr", "Dodge The Dalek", "Hold Music", "Trip Cost Calc"]

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if DeviceType.i4s {
            return CGSizeMake(150, 150)
        } else if DeviceType.i5{
            return CGSizeMake(150, 150)
        }else if DeviceType.i6{
            return CGSizeMake(175, 175)
        }else if DeviceType.i6plus{
            return CGSizeMake(200, 200)
        } else if DeviceType.ipad{
            return CGSizeMake(175, 175)
        }else{
            return CGSizeMake(150, 150)
        }
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.infoview.transform = CGAffineTransformScale(self.infoview.transform, 0, 0)

        let blurEffect2: UIBlurEffect = UIBlurEffect(style: .Dark)
        let blurView2: UIVisualEffectView = UIVisualEffectView(effect: blurEffect2)
        
        blurView2.frame = CGRectMake(0, 0, self.view.frame.width, 60)
        self.view.addSubview(blurView2)
        
        let vibrancyView2: UIVisualEffectView = UIVisualEffectView(effect: UIVibrancyEffect(forBlurEffect: blurEffect2))
        vibrancyView2.frame = blurView2.bounds
        blurView2.contentView.addSubview(vibrancyView2)
        
        
        let label: UILabel = UILabel()
        label.frame = CGRectMake(0, -10, self.view.frame.width, 50)
        label.text = "My Apps"
        label.font = UIFont(name: "HelveticaNeue", size: 32)
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        vibrancyView2.contentView.addSubview(label)
        
        let label2: UILabel = UILabel()
        label2.frame = CGRectMake(0, 18, self.view.frame.width, 50)
        label2.text = "Tap For More Information"
        label2.font = UIFont(name: "HelveticaNeue", size: 20)
        label2.textAlignment = .Center
        label2.textColor = UIColor.whiteColor()
        vibrancyView2.contentView.addSubview(label2)
        
        let button   = UIButton(type: UIButtonType.Custom) as UIButton
        button.frame = CGRectMake(0, 10, 40, 40)
        
        let image = UIImage(named: "back.png")
        button.setImage(image, forState: UIControlState.Normal)
        
        button.setTitle("Back", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        vibrancyView2.contentView.addSubview(button)
        
        
    }

    
    @IBAction func close(sender: AnyObject) {
        self.closeb.hidden = true

        UIView.animateWithDuration(0.5,
            delay: 0,
            usingSpringWithDamping: 0.9,
            initialSpringVelocity: 1.0,
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                self.infoview.transform = CGAffineTransformScale(self.infoview.transform, 0.002, 0.002)

            }, completion: {(_) -> Void in
                self.infoview.hidden = true
                self.collector.userInteractionEnabled = true
                self.desctext.hidden = true
                self.appimage.hidden = true
        })

    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        infoview.hidden = false
        self.appimage.hidden = false
        UIView.animateWithDuration(0.5,
            delay: 0,
            usingSpringWithDamping: 0.9,
            initialSpringVelocity: 1.0,
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                self.infoview.transform = CGAffineTransformIdentity
            }, completion: {(_) -> Void in
                self.closeb.hidden = false
                self.desctext.hidden = false
                self.collector.userInteractionEnabled = false
        })
        

        if indexPath.section == 0 {
            if indexPath.row == 0 {
                appimage.image = UIImage(named:"celllaws.jpg")
                desctext.text = "Quickly and easily see the cell phone laws for your current state or any other state in the US."
                url = "https://itunes.apple.com/us/app/cell-laws/id707987011?mt=8"
                openb.enabled = true
            } else if indexPath.row == 1 {
                
                appimage.image = UIImage(named:"crowd.jpg")
                desctext.text = "CrowdFindr enables you to easily send your location to a friend so they can find you in a crowd, at a conference, theater, or music venue."
                url = "https://itunes.apple.com/us/app/crowdfindr/id675221925?mt=8"
                openb.enabled = true
            } else if indexPath.row == 2 {
                appimage.image = UIImage(named:"dalek1.jpg")
                desctext.text = "Play as the Doctor and escape the Daleks. In the timed game mode avoid the Daleks, Cybermen, and Cybermats for as long as possible. In the classic game mode avoid the Daleks and escape to the TARDIS."
                url = "https://itunes.apple.com/us/app/dodge-the-dalek/id593777565?mt=8"
                openb.enabled = true
            } else if indexPath.row == 3 {
                appimage.image = UIImage(named:"hold.jpg")
                desctext.text = "Hold Music lets you easily change the hold music that is played when a company puts you on hold to any song from your iPhone's music library."
                url = "https://itunes.apple.com/us/app/hold-music/id399862268?mt=8"
                openb.enabled = true
            } else if indexPath.row == 4 {
                appimage.image = UIImage(named:"tripcost.jpg")
                desctext.text = "Easily calculate the cost of a trip. \n See the current national average gas price for regular, mid, premium, diesel, and E85. \n Compare gas prices from 1930-2010"
                url = "https://itunes.apple.com/us/app/trip-cost-calc/id691516672?mt=8"
                openb.enabled = true
            }
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                appimage.image = UIImage(named:"hcpsstatus.jpg")
                desctext.text = "This app displays the status of various Henrico County Public Schools resources. Use this app to quickly check to make sure Blogs, HCPS Link, HCPS main page, Schoolspace, and Teachers.Henrico are up and running and ready to use."
                url = "https://itunes.apple.com/us/app/hcps-status/id826550425?mt=8"
                openb.enabled = true
            } else if indexPath.row == 1 {
                appimage.image = UIImage(named:"hcpsschools.PNG")
                desctext.text = "This app lets you view information from any Henrco County Public School, including class schedule, announcements, school calendar, and contact information."
                url = "none"
                openb.setTitle("Not In App Store Yet", forState: UIControlState.Normal)
                openb.enabled = false
            }
        }else if indexPath.section == 2 {
            if indexPath.row == 0 {
                appimage.image = UIImage(named:"2013paul.PNG")
                desctext.text = "My app submission for the 2013 WWDC student scholarship."
                openb.setTitle("Not In App Store", forState: UIControlState.Normal)
                openb.enabled = false
            } else if indexPath.row == 1 {
                appimage.image = UIImage(named:"2014paul.PNG")
                desctext.text = "My app submission for the 2014 WWDC student scholarship."
                openb.setTitle("Not In App Store", forState: UIControlState.Normal)
                openb.enabled = false
            }
        }

    }
    

    @IBAction func open(sender: AnyObject) {
        let urler  = NSURL(string: url)
        if UIApplication.sharedApplication().canOpenURL(urler!) == true  {
            UIApplication.sharedApplication().openURL(urler!)
        }
    }
    
    func buttonAction(sender:UIButton!)
    {
        navigationController!.popViewControllerAnimated(true)
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
        
    }
    
    func collectionView(collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        atIndexPath indexPath: NSIndexPath)
        -> UICollectionReusableView {
            
            var header: AppCollectionReusableView?
            
            if kind == UICollectionElementKindSectionHeader {
                header =
                    collectionView.dequeueReusableSupplementaryViewOfKind(kind,
                        withReuseIdentifier: "Header", forIndexPath: indexPath)
                    as? AppCollectionReusableView
                if indexPath.section == 0{
                    header?.headerlabel.text = "Self - Employed"
                } else if indexPath.section == 1 {
                    header?.headerlabel.text = "HCPS"
                } else if indexPath.section == 2 {
                    header?.headerlabel.text = "WWDC"
                }
            }
            return header!
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
        return 5
        } else {
            return 2
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        collectionView.backgroundColor = UIColor.clearColor()
        let cell: AppCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Celler", forIndexPath: indexPath) as! AppCollectionViewCell
        if indexPath.section == 0{
            cell.image.image = UIImage(named: images[indexPath.row])
            cell.label.text = labels[indexPath.row]
        } else if indexPath.section == 1 {
            if indexPath.row == 0{
                cell.image.image = UIImage(named: "hcpsstatuslogo.png")
                cell.label.text = "HCPS Status"
            }else{
                cell.image.image = UIImage(named: "hcpsschoollogo.png")
                cell.label.text = "HCPS Schools"
            }
        } else{
            if indexPath.row == 0{
                cell.image.image = UIImage(named: "icon2013.png")
                cell.label.text = "Paul Dippold 2013"
            }else{
                cell.image.image = UIImage(named: "icon2014.png")
                cell.label.text = "Paul Dippold 2014"
            }
        }
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

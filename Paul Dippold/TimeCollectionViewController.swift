//
//  TimeCollectionViewController.swift
//  Paul Dippold
//
//  Created by Paul Dippold on 4/21/15.
//  Copyright (c) 2015 Paul Dippold. All rights reserved.
//

import UIKit

class TimeCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
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

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if DeviceType.i4s {
        return CGSizeMake(314, 314)
        } else if DeviceType.i5{
            return CGSizeMake(314, 314)
        }else if DeviceType.i6{
            return CGSizeMake(400, 400)
        }else if DeviceType.i6plus{
            return CGSizeMake(414, 414)
        } else if DeviceType.ipad{
            return CGSizeMake(600, 600)
        }else{
            return CGSizeMake(300, 300)
        }
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()

        let blurEffect2: UIBlurEffect = UIBlurEffect(style: .Dark)
       let blurView2: UIVisualEffectView = UIVisualEffectView(effect: blurEffect2)
        
        blurView2.frame = CGRectMake(0, 0, self.view.frame.width, 60)
        self.view.addSubview(blurView2)
        
        let vibrancyView2: UIVisualEffectView = UIVisualEffectView(effect: UIVibrancyEffect(forBlurEffect: blurEffect2))
        vibrancyView2.frame = blurView2.bounds
        blurView2.contentView.addSubview(vibrancyView2)
        
        
        let label: UILabel = UILabel()
        label.frame = CGRectMake(0, 0, self.view.frame.width, 60)
        label.text = "Timeline"
        label.font = UIFont(name: "HelveticaNeue", size: 32)
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        vibrancyView2.contentView.addSubview(label)
        
        let button   = UIButton(type: UIButtonType.Custom) as UIButton
        button.frame = CGRectMake(0, 10, 40, 40)
        
        let image = UIImage(named: "back.png")
        button.setImage(image, forState: UIControlState.Normal)
        
        button.setTitle("Back", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        vibrancyView2.contentView.addSubview(button)
}


    
    func buttonAction(sender:UIButton!)
    {
navigationController!.popViewControllerAnimated(true)
    }
    

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 5
        
    }
    
     func collectionView(collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        atIndexPath indexPath: NSIndexPath)
        -> UICollectionReusableView {
            
            var header: TimeCollectionReusableView?
            
            if kind == UICollectionElementKindSectionHeader {
                header =
                    collectionView.dequeueReusableSupplementaryViewOfKind(kind,
                        withReuseIdentifier: "Header", forIndexPath: indexPath)
                    as? TimeCollectionReusableView
                if indexPath.section == 0{
                header?.headerlabel.text = "2009"
                    
                } else if indexPath.section == 1 {
                    header?.headerlabel.text = "2011"

                } else if indexPath.section == 2 {
                    header?.headerlabel.text = "2013"
                    
                } else if indexPath.section == 3 {
                    header?.headerlabel.text = "2014"
                    
                } else if indexPath.section == 4 {
                    header?.headerlabel.text = "2015"
                    
                } else {
                    header?.headerlabel.text = "1"
                    
                }
            }
            return header!
    }

    
     func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
        return 1
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return 3
        } else if section == 3 {
            return 2
        } else if section == 4 {
            return 1
        } else {
            return 1
        }

    }
    
     func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        collectionView.backgroundColor = UIColor.clearColor()
        let cell: TimeCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! TimeCollectionViewCell
        if indexPath.section == 0 {
        cell.desc.text = "November: \n Mac Mini, given for my birthday, allowed me to continue exploring the underlying programming of my iPod Touch and begin developing my own applications"
        cell.image.image = UIImage(named: "IMG_0608.JPG")
        } else if indexPath.section == 1 {
            cell.desc.text = "April: \n Recipient of Style Weekly's '16 under 16 Award' for achievements in technology \n Article: http://issuu.com/styleweekly/docs/16under16_2011web2/7?e=1555377/5510366"
            cell.image.image = UIImage(named: "style.jpg")
        }else if indexPath.section == 2 {
            if indexPath.row == 0 {
            cell.desc.text = "January-October: \n Developed and sold an application to view grades and attendance based on Henrico County Public School's grade viewing website Article: http://www.richmond.com/news/local/education/godwin-student-creates-app-for-henrico-schools/article_f0aee1df-0e3c-5efe-948d-e4aae2905a4e.html?mode=jqm"
            cell.image.image = UIImage(named: "hcps.jpg")
            } else if indexPath.row == 1 {
                cell.desc.text = "October: \n Negotiated a contract with Henrico County Public Schools to develop new applications and maintain existing ones through graduation in June 2015"
                cell.image.image = UIImage(named: "ID.JPG")
            } else if indexPath.row == 2 {
                cell.desc.text = "June: \n Recipient of 2013 WWDC Student Scholarship"
                cell.image.image = UIImage(named: "2013acceptance.png")
            }
        }else if indexPath.section == 3 {
            if indexPath.row == 0 {
                cell.desc.text = "January: \n Recognized for achievements in technology by the Henrico County Public School Board"
                cell.image.image = UIImage(named: "hcps-new.png")
            } else if indexPath.row == 1 {
                cell.desc.text = "June: \n Recipient of 2014 WWDC Student Scholarship"
                cell.image.image = UIImage(named: "2014acceptance.png")
            }
        }else if indexPath.section == 4 {
            cell.desc.text = "April: \n Awarded a Second Century STEM Scholarship from James Madison University, covering 75% of tuition and fees"
            cell.image.image = UIImage(named: "jmu.jpg")
        } else {
            cell.desc.text = "None"
            cell.image.image = UIImage(named: "1.jpg")
        }
        return cell

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

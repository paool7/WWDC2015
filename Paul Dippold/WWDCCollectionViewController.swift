//
//  WWDCCollectionViewController.swift
//  Paul Dippold
//
//  Created by Paul Dippold on 4/21/15.
//  Copyright (c) 2015 Paul Dippold. All rights reserved.
//

import UIKit

class WWDCCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
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
    
    var labels: [String] = ["WWDC 2013 Badge","Moscone West", "Apple Headquarters", "Moscone West", "Apple Headquarters", "Bill Nye"]
    var images: [String] = ["wwdc2013.png", "wwdc1.png", "wwdc2.png", "wwp.png", "wwdc14.jpg", "wwdc16.jpg"]
    var labels2: [String] = ["WWDC 2014 Badge","Keynote", "Star Wars", "Scholarship Winners", "Apple Gift", "Keynote Line", "Moscone West", "Muir Woods", "Keynote Line", "Keynote", "WWDC Bash", "Star Wars", "Keynote Line 3AM"]
    var images2: [String] = ["wwdc2014.png","wwdc3.png", "wwdc4.png", "wwdc5.png", "wwdc6.png", "wwdc7.png", "wwdc8.png", "wwdc9.png", "wwdc10.jpg", "wwdc11.jpg", "wwdc12.jpg", "wwdc13.jpg", "wwdc15.jpg"]

    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if DeviceType.i4s {
        return CGSizeMake(200, 200)
        } else if DeviceType.i5{
            return CGSizeMake(225, 225)
        }else if DeviceType.i6{
            return CGSizeMake(270, 270)
        }else if DeviceType.i6plus{
            return CGSizeMake(300, 300)
        } else if DeviceType.ipad{
            return CGSizeMake(350, 350)
        }else{
            return CGSizeMake(250, 250)
        }
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()

        let blurEffect2: UIBlurEffect = UIBlurEffect(style: .Dark)
       let blurView2: UIVisualEffectView = UIVisualEffectView(effect: blurEffect2)
        
        blurView2.frame = CGRectMake(0, 0, self.view.frame.width, 50)
        self.view.addSubview(blurView2)
        
        let vibrancyView2: UIVisualEffectView = UIVisualEffectView(effect: UIVibrancyEffect(forBlurEffect: blurEffect2))
        vibrancyView2.frame = blurView2.bounds
        blurView2.contentView.addSubview(vibrancyView2)
        
        
        let label: UILabel = UILabel()
        label.frame = CGRectMake(0, 0, self.view.frame.width, 50)
        label.text = "Past WWDCs"
        label.font = UIFont(name: "HelveticaNeue", size: 32)
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        vibrancyView2.contentView.addSubview(label)
        
        let button   = UIButton(type: UIButtonType.Custom) as UIButton
        button.frame = CGRectMake(0, 5, 40, 40)
        
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
        return 2
        
    }
    
     func collectionView(collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        atIndexPath indexPath: NSIndexPath)
        -> UICollectionReusableView {
            
            var header: WWDCCollectionReusableView?
            
            if kind == UICollectionElementKindSectionHeader {
                header =
                    collectionView.dequeueReusableSupplementaryViewOfKind(kind,
                        withReuseIdentifier: "Header", forIndexPath: indexPath)
                    as? WWDCCollectionReusableView
                if indexPath.section == 0{
                header?.headerlabel.text = "WWDC 2013"
                } else{
                    header?.headerlabel.text = "WWDC 2014"

                }
            }
            return header!
    }

    
     func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
        return labels.count
        } else{
         return labels2.count
        }

    }
    
     func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        collectionView.backgroundColor = UIColor.clearColor()
        let cell: WWDCCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! WWDCCollectionViewCell
        if indexPath.section == 0{
        cell.label.text = labels[indexPath.row]
        cell.image.image = UIImage(named: images[indexPath.row])
        return cell
        } else {
            cell.label.text = labels2[indexPath.row]
            cell.image.image = UIImage(named: images2[indexPath.row])
            return cell
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

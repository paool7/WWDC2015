//
//  PhotoCollection.swift
//  Paul Dippold
//
//  Created by Paul Dippold on 4/25/15.
//  Copyright (c) 2015 Paul Dippold. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class PhotoCollection: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet var collecter: UICollectionView!
    @IBOutlet var imager: UIImageView!
    @IBOutlet var closeb: UIButton!
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
    
    var images: [String] = ["1.jpeg", "2.jpeg", "3.jpeg", "4.jpeg", "5.jpeg", "6.jpeg", "7.jpeg", "8.jpeg", "9.jpeg", "10.jpeg", "11.jpeg", "12.jpeg", "14.jpeg", "15.jpeg", "16.jpeg", "18.jpeg", "19.jpeg", "20.jpeg", "23.jpeg", "24.jpeg", "25.jpeg", "26.jpeg", "28.jpeg", "30.jpeg", "31.jpeg", "33.jpeg", "34.jpeg", "35.jpeg", "36.jpeg", "37.jpeg", "38.jpeg", "39.jpeg", "40.jpeg", "41.jpeg", "42.jpeg", "43.jpeg", "44.jpeg", "45.jpeg", "46.jpeg", "47.jpeg", "48.jpeg", "49.jpeg", "50.jpeg", "51.jpeg", "52.jpeg", "53.jpeg", "54.jpeg", "55.jpeg", "56.jpeg", "57.jpeg", "58.jpeg", "59.jpeg", "60.jpeg", "61.jpeg", "62.jpeg", "63.jpeg", "64.jpeg", "65.jpeg", "66.jpeg", "67.jpeg", "68.jpeg", "69.jpeg", "70.jpeg", "71.jpeg", "72.jpeg", "73.jpeg", "74.jpeg", "75.jpeg", "76.jpeg", "77.jpeg", "78.jpeg", "79.jpeg", "80.jpeg"]
    
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
            return CGSizeMake(300, 300)
        }else{
            return CGSizeMake(250, 250)
        }
    }
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imager.transform = CGAffineTransformScale(self.imager.transform, 0, 0)

        let blurEffect2: UIBlurEffect = UIBlurEffect(style: .Dark)
        let blurView2: UIVisualEffectView = UIVisualEffectView(effect: blurEffect2)
        
        blurView2.frame = CGRectMake(0, 0, self.view.frame.width, 60)
        self.view.addSubview(blurView2)
        
        let vibrancyView2: UIVisualEffectView = UIVisualEffectView(effect: UIVibrancyEffect(forBlurEffect: blurEffect2))
        vibrancyView2.frame = blurView2.bounds
        blurView2.contentView.addSubview(vibrancyView2)
        
        
        let label: UILabel = UILabel()
        label.frame = CGRectMake(0, -10, self.view.frame.width, 50)
        label.text = "Photography"
        label.font = UIFont(name: "HelveticaNeue", size: 32)
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        vibrancyView2.contentView.addSubview(label)
        
        let label2: UILabel = UILabel()
        label2.frame = CGRectMake(0, 18, self.view.frame.width, 50)
        label2.text = "Tap To View Full Size"
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

    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.imager.hidden = false
        self.imager.image = UIImage(named: self.images[indexPath.row])
        UIView.animateWithDuration(0.5,
            delay: 0,
            usingSpringWithDamping: 0.9,
            initialSpringVelocity: 1.0,
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                self.imager.transform = CGAffineTransformIdentity
            }, completion: {(_) -> Void in
                self.closeb.hidden = false
                self.collecter.userInteractionEnabled = false
        })

    }
    
    
    @IBAction func close(sender: AnyObject) {
        self.closeb.hidden = true
        UIView.animateWithDuration(0.5,
            delay: 0,
            usingSpringWithDamping: 0.9,
            initialSpringVelocity: 1.0,
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                self.imager.transform = CGAffineTransformScale(self.imager.transform, 0.002, 0.002)
            }, completion: {(_) -> Void in
                self.imager.hidden = true
                self.collecter.userInteractionEnabled = true
        })

    }
    
    func buttonAction(sender:UIButton!)
    {
        navigationController!.popViewControllerAnimated(true)
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
        
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
        
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        collectionView.backgroundColor = UIColor.clearColor()
        let cell: PhotoCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Celler", forIndexPath: indexPath) as! PhotoCollectionViewCell
        cell.image.layer.cornerRadius = 12
        cell.image.layer.borderColor = UIColor.blackColor().CGColor
        cell.image.layer.borderWidth = 2
        cell.image.image = UIImage(named: images[indexPath.row])
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//
//  ViewController.swift
//  Paul Dippold
//
//  Created by Paul Dippold on 4/14/15.
//  Copyright (c) 2015 Paul Dippold. All rights reserved.
//

import UIKit
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

class ViewController: UIViewController {
    @IBOutlet var appb: UIButton!
    @IBOutlet var photob: UIButton!
    @IBOutlet var experienceb: UIButton!
    @IBOutlet var hobbiesb: UIButton!
    @IBOutlet var awardsb: UIButton!
    @IBOutlet var backgb: UIButton!
    @IBOutlet var labeler: UILabel!
    @IBOutlet var textview4: UITextView!
    @IBOutlet var textview3: UITextView!
    @IBOutlet var textview2: UITextView!
    @IBOutlet var imageviewer: UIImageView!
    @IBOutlet var infoimage: UIImageView!
    @IBOutlet var closeb: UIButton!
    @IBOutlet var morebutton: UIButton!
    @IBOutlet var experience: UIView!
    @IBOutlet var hobbies: UIView!
    @IBOutlet var Awards: UIView!
    @IBOutlet var background: UIView!
    @IBOutlet var appsl: UILabel!
    @IBOutlet var appspic: UIImageView!
    @IBOutlet var histl: UILabel!
    @IBOutlet var histpic: UIImageView!
    @IBOutlet var photogl: UILabel!
    @IBOutlet var photogpic: UIImageView!
    @IBOutlet var dubdubpic: UIImageView!
    @IBOutlet var pastwwdc: UILabel!
    @IBOutlet var buttonimage1: UIImageView!
    @IBOutlet var textview: UITextView!
    @IBOutlet var pic1: UIImageView!
    @IBOutlet var viewer: UIView!
    @IBOutlet var viewer2: UIView!
    @IBOutlet var viewer3: UIView!
    @IBOutlet var viewer4: UIView!
    @IBOutlet var wallb: UIButton!
    @IBOutlet var textview5: UITextView!
    @IBOutlet var wallv: UIView!
    @IBOutlet var timeb: UIButton!
    var wallsel = false
    var stringtime = 0
    var scale: Double = 0
    var move: Double = 0
    var blurView: UIVisualEffectView = UIVisualEffectView()
    var blurView2: UIVisualEffectView = UIVisualEffectView()
    var vibrancyView2: UIVisualEffectView = UIVisualEffectView()
    let button   = UIButton(type: UIButtonType.Custom) as UIButton
    var timer = NSTimer()
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()

        if DeviceType.i6plus{
            scale = 1
            move = 40
        } else if DeviceType.i6{
            scale = 0.75
            move = 15
        } else if DeviceType.i5{
            scale = 0.75
            move = 45
        } else if DeviceType.i4s{
            scale = 0.5
            move = 75
        } else if DeviceType.ipad{
            scale = 1
            move = 0
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
        otitle()
        animate()
    }
    
    func otitle(){

        let blurEffect: UIBlurEffect = UIBlurEffect(style: .Dark)
        
         blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = CGRectMake(0, 0, self.view.frame.width, 60)
        self.view.addSubview(blurView)
        
        let vibrancyView: UIVisualEffectView = UIVisualEffectView(effect: UIVibrancyEffect(forBlurEffect: blurEffect))
        vibrancyView.frame = blurView.bounds
        blurView.contentView.addSubview(vibrancyView)
        
        let label: UILabel = UILabel()
        label.frame = CGRectMake(0, -10, self.view.frame.width, 50)
        label.text = "Paul Dippold"
        label.font = UIFont(name: "HelveticaNeue", size: 32)
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        vibrancyView.contentView.addSubview(label)
        
        let label2: UILabel = UILabel()
        label2.frame = CGRectMake(0, 18, self.view.frame.width, 50)
        label2.text = "18 Years Old"
        label2.font = UIFont(name: "HelveticaNeue", size: 20)
        label2.textAlignment = .Center
        label2.textColor = UIColor.whiteColor()
        vibrancyView.contentView.addSubview(label2)
        
    }
    
    func animate(){
    
        let path = UIBezierPath()
        let sides = 6
        let radius = 8
   
        let width = Float(min(125, 125))

        let length = (width - 2) * cosf(Float(2.0 * M_PI) / Float(6) / 2.0) + Float(radius) * tanf(Float(2.0 * M_PI) / Float(sides) / 2.0) / 2.0
        let sideLength = length * tanf(Float(2.0 * M_PI) / Float(sides) / 2.0)
        
        var point = CGPointMake(CGFloat((width / 2.0) + (sideLength / 2.0) - Float(radius) * tanf(Float(2.0 * M_PI) / Float(sides) / 2.0)), CGFloat(width - (width - length) / 2.0))
        var angle = Float(M_PI)
        path.moveToPoint(point)
        
        for var side = 0; side < sides; side++ {
            
            let x = Float(point.x) + (sideLength - Float(radius) * tanf(Float(2.0 * M_PI) / Float(sides) / 2.0) * 2.0) * cosf(angle)
            let y = Float(point.y) + (sideLength - Float(radius) * tanf(Float(2.0 * M_PI) / Float(sides) / 2.0) * 2.0) * sinf(angle)
            
            point = CGPointMake(CGFloat(x), CGFloat(y))
            path.addLineToPoint(point)
            
            let center = CGPointMake(CGFloat(Float(point.x) + Float(radius) * cosf(angle + Float(M_PI_2))), CGFloat(Float(point.y) + Float(radius) * sinf(angle + Float(M_PI_2))))
            
            path.addArcWithCenter(center, radius: CGFloat(Float(radius)), startAngle: CGFloat(angle) - CGFloat(M_PI_2), endAngle: CGFloat(angle) + CGFloat(Float(2.0 * M_PI) / Float(sides)) - CGFloat(M_PI_2), clockwise: true)
            
            point = path.currentPoint
            angle += Float(2.0 * M_PI) / Float(sides)
        }
        
        path.closePath()
        
        let center = CGPoint(x:CGRectGetMidX(CGPathGetBoundingBox(path.CGPath)), y:CGRectGetMidY(CGPathGetBoundingBox(path.CGPath)))
        
        let toOrigin = CGAffineTransformMakeTranslation(-center.x, -center.y)
        path.applyTransform(toOrigin)
        let rotation = CGAffineTransformMakeRotation(CGFloat(M_PI / 6.0))
        path.applyTransform(rotation)
        let fromOrigin = CGAffineTransformMakeTranslation(center.x, center.y)
        path.applyTransform(fromOrigin)
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.CGPath
        maskLayer.lineWidth = 2
        maskLayer.strokeColor = UIColor.clearColor().CGColor;
        maskLayer.fillColor = UIColor.whiteColor().CGColor;
        let border = CAShapeLayer()
        border.path = path.CGPath;
        border.lineWidth = 2;
        border.strokeColor = UIColor.blackColor().CGColor
        border.fillColor = UIColor.clearColor().CGColor
        
        pic1.layer.mask = maskLayer
        pic1.layer.addSublayer(border)
        pic1.clipsToBounds = true
        
        let maskLayer2 = CAShapeLayer()
        maskLayer2.path = path.CGPath
        maskLayer2.lineWidth = 2
        maskLayer2.strokeColor = UIColor.clearColor().CGColor;
        maskLayer2.fillColor = UIColor.whiteColor().CGColor;
        let border2 = CAShapeLayer()
        border2.path = path.CGPath;
        border2.lineWidth = 2;
        border2.strokeColor = UIColor.blackColor().CGColor
        border2.fillColor = UIColor.clearColor().CGColor
        
        background.layer.mask = maskLayer2
        background.layer.addSublayer(border2)
        background.clipsToBounds = true
        
        let maskLayer3 = CAShapeLayer()
        maskLayer3.path = path.CGPath
        maskLayer3.lineWidth = 2
        maskLayer3.strokeColor = UIColor.clearColor().CGColor;
        maskLayer3.fillColor = UIColor.whiteColor().CGColor;
        let border3 = CAShapeLayer()
        border3.path = path.CGPath;
        border3.lineWidth = 2;
        border3.strokeColor = UIColor.blackColor().CGColor
        border3.fillColor = UIColor.clearColor().CGColor
        
        Awards.layer.mask = maskLayer3
        Awards.layer.addSublayer(border3)
        Awards.clipsToBounds = true
        
        let maskLayer4 = CAShapeLayer()
        maskLayer4.path = path.CGPath
        maskLayer4.lineWidth = 2
        maskLayer4.strokeColor = UIColor.clearColor().CGColor;
        maskLayer4.fillColor = UIColor.whiteColor().CGColor;
        let border4 = CAShapeLayer()
        border4.path = path.CGPath;
        border4.lineWidth = 2;
        border4.strokeColor = UIColor.blackColor().CGColor
        border4.fillColor = UIColor.clearColor().CGColor
        
        hobbies.layer.mask = maskLayer4
        hobbies.layer.addSublayer(border4)
        hobbies.clipsToBounds = true
        
        let maskLayer5 = CAShapeLayer()
        maskLayer5.path = path.CGPath
        maskLayer5.lineWidth = 2
        maskLayer5.strokeColor = UIColor.clearColor().CGColor;
        maskLayer5.fillColor = UIColor.whiteColor().CGColor;
        let border5 = CAShapeLayer()
        border5.path = path.CGPath;
        border5.lineWidth = 2;
        border5.strokeColor = UIColor.blackColor().CGColor
        border5.fillColor = UIColor.clearColor().CGColor
        
        experience.layer.mask = maskLayer5
        experience.layer.addSublayer(border5)
        experience.clipsToBounds = true
        
        
        let maskLayer7 = CAShapeLayer()
        maskLayer7.path = path.CGPath
        maskLayer7.lineWidth = 2
        maskLayer7.strokeColor = UIColor.clearColor().CGColor;
        maskLayer7.fillColor = UIColor.whiteColor().CGColor;
        let border7 = CAShapeLayer()
        border7.path = path.CGPath;
        border7.lineWidth = 2;
        border7.strokeColor = UIColor.blackColor().CGColor
        border7.fillColor = UIColor.clearColor().CGColor
        
        wallv.layer.mask = maskLayer7
        wallv.layer.addSublayer(border7)
        wallv.clipsToBounds = true
        
        
        let maskLayer6 = CAShapeLayer()
        maskLayer6.path = path.CGPath
        maskLayer6.lineWidth = 2
        maskLayer6.strokeColor = UIColor.clearColor().CGColor;
        maskLayer6.fillColor = UIColor.whiteColor().CGColor;
        let border6 = CAShapeLayer()
        border6.path = path.CGPath;
        border6.lineWidth = 2;
        border6.strokeColor = UIColor.blackColor().CGColor
        border6.fillColor = UIColor.clearColor().CGColor
        
        imageviewer.layer.mask = maskLayer6
        imageviewer.layer.addSublayer(border6)
        imageviewer.clipsToBounds = true


    }
    

    
    @IBAction func learn(sender: AnyObject) {
        self.pic1.center = self.view.center
        self.pic1.transform = CGAffineTransformIdentity
        blurView.removeFromSuperview()
        let blurEffect2: UIBlurEffect = UIBlurEffect(style: .Dark)
        blurView2 = UIVisualEffectView(effect: blurEffect2)
        
        blurView2.frame = CGRectMake(0, 0, self.view.frame.width, 60)
        self.view.addSubview(blurView2)
        
         vibrancyView2 = UIVisualEffectView(effect: UIVibrancyEffect(forBlurEffect: blurEffect2))
        vibrancyView2.frame = blurView2.bounds
        blurView2.contentView.addSubview(vibrancyView2)

        
        let label: UILabel = UILabel()
        label.frame = CGRectMake(0, 0, self.view.frame.width, 60)
        label.text = "Choose Topic"
        label.font = UIFont(name: "HelveticaNeue", size: 32)
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        vibrancyView2.contentView.addSubview(label)
        
       button.frame = CGRectMake(0, 10, 40, 40)
        
        let image = UIImage(named: "back.png")
        button.setImage(image, forState: UIControlState.Normal)
        button.enabled = false
        button.setTitle("Back", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        vibrancyView2.contentView.addSubview(button)
        self.viewer.transform = CGAffineTransformIdentity
        self.viewer2.transform = CGAffineTransformIdentity
        self.viewer3.transform = CGAffineTransformIdentity
        self.viewer4.transform = CGAffineTransformIdentity
        viewer.hidden = false
        viewer2.hidden = false
        viewer3.hidden = false
        viewer4.hidden = false
        closeb.hidden = true
        UIView.animateWithDuration(1,
            delay: 0,
            usingSpringWithDamping: 0.9,
            initialSpringVelocity: 1.0,
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                self.morebutton.hidden = true
                self.textview.hidden = true
                self.textview2.hidden = true
                self.textview3.hidden = true
                self.textview4.hidden = true
                self.textview5.hidden = true
                self.viewer.transform = CGAffineTransformScale(self.viewer.transform, 0.65, 0.4275)
                let xtransform1 = self.viewer.bounds.origin.x-(self.view.bounds.width/5.65)
                let ytransform1 = self.viewer.bounds.origin.y-(self.view.bounds.height/2.6)
                self.viewer.transform = CGAffineTransformTranslate(self.viewer.transform, xtransform1, ytransform1)
                self.viewer2.transform = CGAffineTransformScale(self.viewer2.transform, 0.65, 0.4275)
                let xtransform2 = self.viewer2.bounds.origin.x-(self.view.bounds.width/5.65)
                let ytransform2 = self.viewer2.bounds.origin.y-(self.view.bounds.height/2.6)
                self.viewer2.transform = CGAffineTransformTranslate(self.viewer2.transform, -xtransform2, ytransform2)
                self.viewer3.transform = CGAffineTransformScale(self.viewer3.transform, 0.65, 0.4275)
                let xtransform3 = self.viewer3.bounds.origin.x-(self.view.bounds.width/5.65)
                let ytransform3 = self.viewer3.bounds.origin.y-(self.view.bounds.height/2.6)
                self.viewer3.transform = CGAffineTransformTranslate(self.viewer3.transform, xtransform3, -ytransform2)
                self.viewer4.transform = CGAffineTransformScale(self.viewer4.transform, 0.65, 0.4275)
                let xtransform4 = self.viewer4.bounds.origin.x-(self.view.bounds.width/5.65)
                let ytransform4 = self.viewer4.bounds.origin.y-(self.view.bounds.height/2.6)
                self.viewer4.transform = CGAffineTransformTranslate(self.viewer4.transform, -xtransform4, -ytransform2)
                self.pic1.transform = CGAffineTransformScale(self.pastwwdc.transform, CGFloat(self.scale), CGFloat(self.scale))
                self.pic1.transform = CGAffineTransformTranslate(self.pic1.transform, 0, CGFloat(self.move))
                self.pastwwdc.transform = CGAffineTransformScale(self.pastwwdc.transform, 1, 1.53846)
                self.dubdubpic.transform = CGAffineTransformScale(self.dubdubpic.transform, 1, 1.25)
                self.photogl.transform = CGAffineTransformScale(self.photogl.transform, 1, 1.53846)
                self.photogpic.transform = CGAffineTransformScale(self.photogpic.transform, 1, 1.25)
                self.histl.transform = CGAffineTransformScale(self.histl.transform, 1, 1.53846)
                self.histpic.transform = CGAffineTransformScale(self.histpic.transform, 1, 1.2)
                self.appsl.transform = CGAffineTransformScale(self.appsl.transform, 1, 1.53846)
                self.appspic.transform = CGAffineTransformScale(self.appspic.transform, 1, 1.25)
                self.view.viewWithTag(1)?.hidden = true
                self.viewer.viewWithTag(1)?.hidden = false
                self.viewer.viewWithTag(2)?.hidden = false
                self.viewer2.viewWithTag(1)?.hidden = false
                self.viewer2.viewWithTag(2)?.hidden = false
                self.viewer3.viewWithTag(1)?.hidden = false
                self.viewer3.viewWithTag(2)?.hidden = false
                self.viewer4.viewWithTag(1)?.hidden = false
                self.viewer4.viewWithTag(2)?.hidden = false
                self.viewer.layer.zPosition = 2
                self.viewer2.layer.zPosition = 3
                self.viewer3.layer.zPosition = 4
                self.viewer4.layer.zPosition = 5
                self.viewer.backgroundColor = UIColor.blackColor()
                self.viewer2.backgroundColor = UIColor.blackColor()
                self.viewer3.backgroundColor = UIColor.blackColor()
                self.viewer4.backgroundColor = UIColor.blackColor()
                
                self.background.transform = CGAffineTransformScale(self.background.transform, 0.002, 0.002)
                self.Awards.transform = CGAffineTransformScale(self.Awards.transform, 0.002, 0.002)
                self.hobbies.transform = CGAffineTransformScale(self.hobbies.transform, 0.002, 0.002)
                self.experience.transform = CGAffineTransformScale(self.experience.transform, 0.002, 0.002)
                self.imageviewer.transform = CGAffineTransformScale(self.imageviewer.transform, 0.002, 0.002)
                self.wallv.transform = CGAffineTransformScale(self.imageviewer.transform, 0.002, 0.002)

                let delay = dispatch_time(DISPATCH_TIME_NOW,
                    Int64(1.2 * Double(NSEC_PER_SEC)))
                dispatch_after(delay, dispatch_get_main_queue()) {
                    self.hider()
                }
            }, completion: {(_) -> Void in

        })
        
    }
    
    @IBAction func close(sender: AnyObject) {
          wallsel = false
        UIView.animateWithDuration(0.75,
            delay: 0,
            usingSpringWithDamping: 0.9,
            initialSpringVelocity: 1.0,
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                self.viewer.transform = CGAffineTransformScale(self.viewer.transform, 0.002, 0.002)
                self.viewer2.transform = CGAffineTransformScale(self.viewer2.transform, 0.002, 0.002)
                self.viewer3.transform = CGAffineTransformScale(self.viewer3.transform, 0.002, 0.002)
                self.viewer4.transform = CGAffineTransformScale(self.viewer4.transform, 0.002, 0.002)
                self.textview.transform = CGAffineTransformScale(self.textview.transform, 0.002, 0.002)
                self.textview2.transform = CGAffineTransformScale(self.textview2.transform, 0.002, 0.002)
                self.textview3.transform = CGAffineTransformScale(self.textview3.transform, 0.002, 0.002)
                self.textview4.transform = CGAffineTransformScale(self.textview4.transform, 0.002, 0.002)
                self.textview5.transform = CGAffineTransformScale(self.textview4.transform, 0.002, 0.002)
                self.infoimage.transform = CGAffineTransformScale(self.infoimage.transform, 0.002, 0.002)
                self.closeb.hidden = true
                self.labeler.hidden = true
            }, completion: {(_) -> Void in
                self.viewer.hidden = true
                self.viewer2.hidden = true
                self.viewer3.hidden = true
                self.viewer4.hidden = true
                self.textview.hidden = true
                self.textview2.hidden = true
                self.textview3.hidden = true
                self.textview4.hidden = true
                self.textview5.hidden = true
                self.infoimage.hidden = true
                self.backgb.enabled = true
                self.awardsb.enabled = true
                self.hobbiesb.enabled = true
                self.experienceb.enabled = true
                self.morebutton.enabled = true
                self.photob.enabled = true
                self.appb.enabled = true
                self.timeb.enabled = true

        })

    }
    @IBAction func experienceb(sender: AnyObject) {
        unhide("experience")
        labeler.text = "Experience"
        self.infoimage.contentMode = UIViewContentMode.ScaleAspectFit
        self.infoimage.image = UIImage(named:"ID.JPG")
    }
    @IBAction func hobbiesb(sender: AnyObject) {
        unhide("hobbies")
        labeler.text = "Hobbies"
        self.infoimage.contentMode = UIViewContentMode.ScaleAspectFill
        self.infoimage.image = UIImage(named:"wall2015.png")
    }
    @IBAction func awardsb(sender: AnyObject) {
        unhide("awards")
        labeler.text = "Awards"
        self.infoimage.contentMode = UIViewContentMode.ScaleAspectFill
        self.infoimage.image = UIImage(named:"acceptance.png")
    }
    @IBAction func backgb(sender: AnyObject) {
        unhide("background")
        labeler.text = "Background"
        self.infoimage.contentMode = UIViewContentMode.ScaleAspectFill
        self.infoimage.image = UIImage(named:"Family.JPG")
    }
    @IBAction func waller(sender: AnyObject) {
        unhide("wall")
        labeler.text = "My Wall"
        self.infoimage.contentMode = UIViewContentMode.ScaleAspectFit
        self.infoimage.image = UIImage(named:"wall2013.JPG")
        wallsel = true
    }
    
    func unhide(sender: String){
        backgb.enabled = false
        awardsb.enabled = false
        hobbiesb.enabled = false
        experienceb.enabled = false
        morebutton.enabled = false
        photob.enabled = false
        appb.enabled = false
        timeb.enabled = false
        
        self.viewer.transform = CGAffineTransformScale(self.viewer.transform, 0, 0)
        self.viewer2.transform = CGAffineTransformScale(self.viewer2.transform, 0, 0)
        self.viewer3.transform = CGAffineTransformScale(self.viewer3.transform, 0, 0)
        self.viewer4.transform = CGAffineTransformScale(self.viewer4.transform, 0, 0)
        self.textview.transform = CGAffineTransformIdentity
        self.textview2.transform = CGAffineTransformIdentity
        self.textview3.transform = CGAffineTransformIdentity
        self.textview4.transform = CGAffineTransformIdentity
        self.textview5.transform = CGAffineTransformIdentity
        self.infoimage.transform = CGAffineTransformIdentity
        UIView.animateWithDuration(0.75,
            delay: 0,
            usingSpringWithDamping: 0.9,
            initialSpringVelocity: 1.0,
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                self.viewer.transform = CGAffineTransformIdentity
                self.viewer2.transform = CGAffineTransformIdentity
                self.viewer3.transform = CGAffineTransformIdentity
                self.viewer4.transform = CGAffineTransformIdentity
                self.viewer.transform = CGAffineTransformScale(self.viewer.transform, 1, 1)
                self.viewer2.transform = CGAffineTransformScale(self.viewer2.transform, 1, 1)
                self.viewer3.transform = CGAffineTransformScale(self.viewer3.transform, 1, 1)
                self.viewer4.transform = CGAffineTransformScale(self.viewer4.transform, 1, 1)
                self.viewer.hidden = false
                self.viewer2.hidden = false
                self.viewer3.hidden = false
                self.viewer4.hidden = false
            }, completion: {(_) -> Void in
                self.labeler.hidden = false
                self.closeb.hidden = false
                if sender == "background"{
                self.textview.hidden = false
                } else if sender == "awards"{
                    self.textview2.hidden = false
                }else if sender == "hobbies"{
                    self.textview3.hidden = false
                }else if sender == "experience"{
                    self.textview4.hidden = false
                }else if sender == "wall"{
                    self.textview5.hidden = false
                }
                self.infoimage.hidden = false
                self.viewer.hidden = false
                self.viewer2.hidden = false
                self.viewer3.hidden = false
                self.viewer4.hidden = false
        })
    }
    
    func hider(){
        self.background.hidden = true
        self.Awards.hidden = true
        self.hobbies.hidden = true
        self.experience.hidden = true
        self.imageviewer.hidden = true
        self.wallv.hidden = true
        labeler.hidden = true
        button.enabled = true
    }
    
    func update() {
        stringtime++
        
        if wallsel == true{
            if stringtime == 5{
                labeler.text = "My Wall 2013"
                UIView.transitionWithView(self.infoimage,
                    duration:1,
                    options: UIViewAnimationOptions.TransitionCrossDissolve,
                    animations: { self.infoimage.image = UIImage(named:"wall2013.JPG") },
                    completion: nil)
            } else if stringtime == 10{
                labeler.text = "My Wall 2014"
                UIView.transitionWithView(self.infoimage,
                    duration:1,
                    options: UIViewAnimationOptions.TransitionCrossDissolve,
                    animations: { self.infoimage.image = UIImage(named:"wall2014.JPG") },
                    completion: nil)
            } else if stringtime == 15{
                labeler.text = "My Wall 2015"
                UIView.transitionWithView(self.infoimage,
                    duration:1,
                    options: UIViewAnimationOptions.TransitionCrossDissolve,
                    animations: { self.infoimage.image = UIImage(named:"wall2015.png") },
                    completion: nil)
            }else if stringtime == 20{
                labeler.text = "My Wall 2013"
                UIView.transitionWithView(self.infoimage,
                    duration:1,
                    options: UIViewAnimationOptions.TransitionCrossDissolve,
                    animations: { self.infoimage.image = UIImage(named:"wall2013.JPG") },
                    completion: nil)
            } else if stringtime == 25{
                labeler.text = "My Wall 2014"
                UIView.transitionWithView(self.infoimage,
                    duration:1,
                    options: UIViewAnimationOptions.TransitionCrossDissolve,
                    animations: { self.infoimage.image = UIImage(named:"wall2014.JPG") },
                    completion: nil)
            }else if stringtime == 30{
                labeler.text = "My Wall 2015"
                UIView.transitionWithView(self.infoimage,
                    duration:1,
                    options: UIViewAnimationOptions.TransitionCrossDissolve,
                    animations: { self.infoimage.image = UIImage(named:"wall2015.png") },
                    completion: nil)
            } else if stringtime == 35{
                labeler.text = "My Wall 2013"
                UIView.transitionWithView(self.infoimage,
                    duration:1,
                    options: UIViewAnimationOptions.TransitionCrossDissolve,
                    animations: { self.infoimage.image = UIImage(named:"wall2013.JPG") },
                    completion: nil)
            }else if stringtime == 40{
                labeler.text = "My Wall 2014"
                UIView.transitionWithView(self.infoimage,
                    duration:1,
                    options: UIViewAnimationOptions.TransitionCrossDissolve,
                    animations: { self.infoimage.image = UIImage(named:"wall2014.JPG") },
                    completion: nil)
            }
            
        }
        if stringtime == 4{
            UIView.transitionWithView(self.pic1,
                duration:1,
                options: UIViewAnimationOptions.TransitionCrossDissolve,
                animations: { self.pic1.image = UIImage(named:"wwp.png") },
                completion: nil)
        } else if stringtime == 8{
            UIView.transitionWithView(self.pic1,
                duration:1,
                options: UIViewAnimationOptions.TransitionCrossDissolve,
                animations: { self.pic1.image = UIImage(named:"wwdc1.png") },
                completion: nil)
        } else if stringtime == 12{
            UIView.transitionWithView(self.pic1,
                duration:1,
                options: UIViewAnimationOptions.TransitionCrossDissolve,
                animations: { self.pic1.image = UIImage(named:"wwdc2.png") },
                completion: nil)
        }else if stringtime == 16{
            UIView.transitionWithView(self.pic1,
                duration:1,
                options: UIViewAnimationOptions.TransitionCrossDissolve,
                animations: { self.pic1.image = UIImage(named:"wwdc3.png") },
                completion: nil)
        }else if stringtime == 20{
            UIView.transitionWithView(self.pic1,
                duration:1,
                options: UIViewAnimationOptions.TransitionCrossDissolve,
                animations: { self.pic1.image = UIImage(named:"wwdc4.png") },
                completion: nil)
        }else if stringtime == 24{
            UIView.transitionWithView(self.pic1,
                duration:1,
                options: UIViewAnimationOptions.TransitionCrossDissolve,
                animations: { self.pic1.image = UIImage(named:"wwdc5.png") },
                completion: nil)
        }else if stringtime == 28{
            UIView.transitionWithView(self.pic1,
                duration:1,
                options: UIViewAnimationOptions.TransitionCrossDissolve,
                animations: { self.pic1.image = UIImage(named:"wwdc6.png") },
                completion: nil)
        }else if stringtime == 32{
            UIView.transitionWithView(self.pic1,
                duration:1,
                options: UIViewAnimationOptions.TransitionCrossDissolve,
                animations: { self.pic1.image = UIImage(named:"wwdc7.png") },
                completion: nil)
        }else if stringtime == 36{
            UIView.transitionWithView(self.pic1,
                duration:1,
                options: UIViewAnimationOptions.TransitionCrossDissolve,
                animations: { self.pic1.image = UIImage(named:"wwdc8.png") },
                completion: nil)
        }else if stringtime == 40{
            UIView.transitionWithView(self.pic1,
                duration:1,
                options: UIViewAnimationOptions.TransitionCrossDissolve,
                animations: {  self.pic1.image = UIImage(named: "wwdc9.png") },
                completion: nil)
            stringtime = 0
        }
            
            
    }
    
    func buttonAction(sender:UIButton!)
    {
        self.otitle()
        UIView.animateWithDuration(1,
            delay: 0,
            usingSpringWithDamping: 0.9,
            initialSpringVelocity: 1.0,
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                self.background.hidden = false
                self.Awards.hidden = false
                self.hobbies.hidden = false
                self.experience.hidden = false
                self.morebutton.hidden = false
                self.imageviewer.hidden = false
                self.wallv.hidden = false
                self.blurView2.removeFromSuperview()
                self.animate()
                self.viewer.transform = CGAffineTransformIdentity
                self.viewer2.transform = CGAffineTransformIdentity
                self.viewer3.transform = CGAffineTransformIdentity
                self.viewer4.transform = CGAffineTransformIdentity
                self.pic1.transform = CGAffineTransformIdentity
                self.view.viewWithTag(1)?.hidden = false
                self.viewer.viewWithTag(1)?.hidden = true
                self.viewer.viewWithTag(2)?.hidden = true
                self.viewer2.viewWithTag(1)?.hidden = true
                self.viewer2.viewWithTag(2)?.hidden = true
                self.viewer3.viewWithTag(1)?.hidden = true
                self.viewer3.viewWithTag(2)?.hidden = true
                self.viewer4.viewWithTag(1)?.hidden = true
                self.viewer4.viewWithTag(2)?.hidden = true
                self.viewer.layer.zPosition = 0
                self.viewer2.layer.zPosition = 0
                self.viewer3.layer.zPosition = 0
                self.viewer4.layer.zPosition = 0
                self.viewer.backgroundColor = UIColor.whiteColor()
                self.viewer2.backgroundColor = UIColor.whiteColor()
                self.viewer3.backgroundColor = UIColor.whiteColor()
                self.viewer4.backgroundColor = UIColor.whiteColor()
                
                self.pastwwdc.transform = CGAffineTransformIdentity
                self.dubdubpic.transform = CGAffineTransformIdentity
                self.photogl.transform = CGAffineTransformIdentity
                self.photogpic.transform = CGAffineTransformIdentity
                self.histl.transform = CGAffineTransformIdentity
                self.histpic.transform = CGAffineTransformIdentity
                self.appsl.transform = CGAffineTransformIdentity
                self.appspic.transform = CGAffineTransformIdentity

                self.background.transform = CGAffineTransformIdentity
                self.Awards.transform = CGAffineTransformIdentity
                self.hobbies.transform = CGAffineTransformIdentity
                self.experience.transform = CGAffineTransformIdentity
                self.imageviewer.transform = CGAffineTransformIdentity
                self.wallv.transform = CGAffineTransformIdentity
                self.viewer.hidden = true
                self.viewer2.hidden = true
                self.viewer3.hidden = true
                self.viewer4.hidden = true

            }, completion: {(_) -> Void in
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


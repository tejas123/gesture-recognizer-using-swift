//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by TheAppGuruz-iOS-103 on 05/02/15.
//  Copyright (c) 2015 TheAppGururz. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var vwBox: UIView!
    
    var firstX:Double = 0;
    var firstY:Double = 0;
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.initializeGestureRecognizer()
    }
    
    func initializeGestureRecognizer()
    {
        //For TapGesture Recognization
        var tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("recognizeTapGesture:"))
        vwBox.addGestureRecognizer(tapGesture)
        
        //For LongPressGesture Recoginzation
        var longPressedGesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: Selector("recognizeLongPressedGesture:"))
        vwBox.addGestureRecognizer(longPressedGesture)

        //For RotateGesture Recoginzation
        var rotateGesture: UIRotationGestureRecognizer = UIRotationGestureRecognizer(target: self, action: Selector("recognizeRotateGesture:"))
        vwBox.addGestureRecognizer(rotateGesture)

        //For PinchGesture Recoginzation
        var pinchGesture: UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: Selector("recognizePinchGesture:"))
        vwBox.addGestureRecognizer(pinchGesture)

        //For PanGesture Recoginzation
        var panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: Selector("recognizePanGesture:"))
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 1
        vwBox.addGestureRecognizer(panGesture)
    }
    
    func recognizeTapGesture(sender: UIGestureRecognizer)
    {
        var colorRed: CGFloat = CGFloat(rand()) / CGFloat(RAND_MAX)
        var colorGreen: CGFloat = CGFloat(rand()) / CGFloat(RAND_MAX)
        var colorBlue: CGFloat = CGFloat(rand()) / CGFloat(RAND_MAX)
        vwBox.backgroundColor = UIColor(red: colorRed, green: colorGreen, blue: colorBlue, alpha: 1)
    }
    
    func recognizeLongPressedGesture(sender: UILongPressGestureRecognizer)
    {
        var colorRed: CGFloat = CGFloat(rand()) / CGFloat(RAND_MAX)
        var colorGreen: CGFloat = CGFloat(rand()) / CGFloat(RAND_MAX)
        var colorBlue: CGFloat = CGFloat(rand()) / CGFloat(RAND_MAX)
        vwBox.backgroundColor = UIColor(red: colorRed, green: colorGreen, blue: colorBlue, alpha: 1)
    }
    
    func recognizeRotateGesture(sender: UIRotationGestureRecognizer)
    {
        sender.view!.transform = CGAffineTransformRotate(sender.view!.transform, sender.rotation)
        sender.rotation = 0
    }
    
    func recognizePinchGesture(sender: UIPinchGestureRecognizer)
    {
        sender.view!.transform = CGAffineTransformScale(sender.view!.transform,
            sender.scale, sender.scale)
        sender.scale = 1
    }
    
    func recognizePanGesture(sender: UIPanGestureRecognizer)
    {
        var translate = sender.translationInView(self.view)
        sender.view!.center = CGPoint(x:sender.view!.center.x + translate.x,
            y:sender.view!.center.y + translate.y)
        sender.setTranslation(CGPointZero, inView: self.view)
    }

}

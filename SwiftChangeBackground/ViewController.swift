//
//  ViewController.swift
//  SwiftChangeBackground
//
//  Created by Yarmolchuk Dima on 08.09.14.
//  Copyright (c) 2014 Yarmolchuk Dima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView:UIImageView = UIImageView()
    var backgroundDict:Dictionary<String, String> = Dictionary()
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width:CGFloat = 320
        let heigth:CGFloat = 568
        
        backgroundDict = ["Background1":"background1", "Background2":"background2"]
        
        var buttonTitles = ["Background 1", "Background 2"]
        
        var view:UIView = UIView(frame: CGRectMake(0, 0, width, heigth))
 
        self.view.addSubview(view)
        
        var backgroundImage:UIImage = UIImage(named:backgroundDict["Background1"]!)
        
        imageView = UIImageView(frame: view.frame)
        imageView.image = backgroundImage
        
        view.addSubview(imageView)
        
        for i in 0 ... buttonTitles.count - 1 {
            
            var button:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
            
            button.frame = CGRectMake(0, 0, 200, 21)
            button.center = CGPointMake(view.center.x, CGFloat(100+i*50))
            
            button.setTitle(buttonTitles[i], forState: UIControlState.Normal)
            button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            
            button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside )
            button.tag = i+1
            
            view.addSubview(button)
        }
    }
    
    func buttonClicked(sender:UIButton) {
        var button:UIButton = sender
        var imagesSelected:String = "Background\(button.tag)"
        
        UIView.animateWithDuration(0.4, animations: {self.imageView.alpha=0}, completion: {
            _ in self.imageView.image = UIImage(named:self.backgroundDict[imagesSelected]!)
            UIView.animateWithDuration(0.4, animations:{self.imageView.alpha=1})
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

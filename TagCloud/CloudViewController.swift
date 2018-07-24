//
//  ViewController.swift
//  TagCloud
//
//  Created by sue on 15/11/27.
//  Copyright © 2015年 sue. All rights reserved.
//

import UIKit

class CloudViewController: UIViewController {
    var sphereView: DBSphereView!
    var patchView: SFPatchView!
    var person: [[AnyObject]] = [["Bili" as AnyObject, UIImage(named: "cloud1")!],
                    ["Peach" as AnyObject, UIImage(named: "cloud1")!],
                    ["Elina" as AnyObject, UIImage(named: "cloud1")!],
                    ["Caroline" as AnyObject, UIImage(named: "cloud1")!],
                    ["Xiuna" as AnyObject, UIImage(named: "cloud1")!],
                    ["Caroline" as AnyObject, UIImage(named: "cloud1")!],
                    ["Big" as AnyObject, UIImage(named: "cloud1")!],
                    ["Big" as AnyObject, UIImage(named: "cloud1")!],
                    ["Big" as AnyObject, UIImage(named: "cloud1")!],
                    ["Big" as AnyObject, UIImage(named: "cloud1")!],
                    ["Big" as AnyObject, UIImage(named: "cloud1")!],
                    ["Big" as AnyObject, UIImage(named: "cloud1")!],
                    ["Big" as AnyObject, UIImage(named: "cloud1")!],
                    ["Big" as AnyObject, UIImage(named: "cloud1")!],
                    ["Big" as AnyObject, UIImage(named: "cloud1")!],
                    ["Big" as AnyObject, UIImage(named: "cloud1")!],
                    ["Big" as AnyObject, UIImage(named: "cloud1")!],
                    ["Big" as AnyObject, UIImage(named: "cloud1")!],
                    ["Big" as AnyObject, UIImage(named: "cloud1")!],
                    ["Big" as AnyObject, UIImage(named: "cloud1")!],
                    ["Big" as AnyObject, UIImage(named: "cloud1")!],
                    ["Lucy" as AnyObject, UIImage(named: "cloud1")!]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sphereView = DBSphereView(frame: CGRect(x: 0, y: 150, width: 1000, height: 1000))
        let array = NSMutableArray(capacity: 0)
        for i in 0 ..< person.count {
            let btn: UIButton = UIButton(type: UIButtonType.system)
//            btn.setTitle(person[i][0] as? String, for: UIControlState())
//            btn.setTitle("ㅇㄴㄹㄴㅇㄹㄴㅇㄹ", for: UIControlState())
            btn.setTitleColor(UIColor.gray, for: .normal);
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0 , bottom: 0, right: 0)
            btn.layer.masksToBounds = true
            btn.setBackgroundImage(person[i][1] as? UIImage, for: UIControlState())
            btn.contentMode = UIViewContentMode.scaleAspectFit
            btn.frame = CGRect(x: 100, y: 100, width: 150, height: 150)
            btn.layer.cornerRadius = 50
//            btn.addTarget(self, action: #selector(ViewController.buttonPressed(_:)), for: UIControlEvents.touchUpInside)
            array.add(btn)
            sphereView.addSubview(btn)
        }
        sphereView.setCloudTags(array as [AnyObject])
        sphereView.backgroundColor = UIColor.white
        self.view.addSubview(sphereView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonPressed(_ btn: UIButton) {
        sphereView.timerStop()
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            btn.transform = CGAffineTransform(scaleX: 2, y: 2)
            }) { (finished) -> Void in
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                 btn.transform = CGAffineTransform(scaleX: 1, y: 1)
                    }, completion: { (finished) -> Void in
                        self.sphereView.timerStart()
                })
        }
    }
    
    


}


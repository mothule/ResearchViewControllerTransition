//
//  ViewController.swift
//  ResearchViewControllerTransition
//
//  Created by mothule on 2016/09/14.
//  Copyright © 2016年 mothule. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var myTransition = MyTransitionDelegate()
    @IBAction func onButton(sender: AnyObject) {
        let vc = UIStoryboard(name: "Main",bundle: nil).instantiateViewControllerWithIdentifier("SecondViewController")
            as! SecondViewController
        vc.transitioningDelegate = myTransition
        presentViewController(vc, animated: true, completion: nil)
    }
}


//
//  ViewController.swift
//  ResearchViewControllerTransition
//
//  Created by mothule on 2016/09/14.
//  Copyright © 2016年 mothule. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func onButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func createImageView() -> UIImageView{
        let image = UIImageView(frame: imageView.frame)
        image.contentMode = imageView.contentMode
        return image
    }
    
}


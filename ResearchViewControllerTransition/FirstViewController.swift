//
//  ViewController.swift
//  ResearchViewControllerTransition
//
//  Created by mothule on 2016/09/14.
//  Copyright © 2016年 mothule. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var myTransition = MyTransitionDelegate()

    let imageQuantity:Int = 9
    var imageView:UIImageView!
    
    @IBAction func onButton(sender: AnyObject) {
    }
    
    func presentSecondView(){
        let vc = UIStoryboard(name: "Main",bundle: nil).instantiateViewControllerWithIdentifier("SecondViewController")
            as! SecondViewController
        vc.transitioningDelegate = myTransition
        presentViewController(vc, animated: true, completion: nil)
    }
    
    func copyImageView() -> UIImageView {
        let image = UIImageView(image: imageView.image)
        image.frame = imageView.convertRect(imageView.bounds, toView: self.view)
        image.contentMode = imageView.contentMode
        return image
    }
}

extension FirstViewController : UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageQuantity
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        }
        cell!.imageView!.contentMode = .ScaleAspectFill
        cell!.imageView!.image = UIImage(named:"hoge\(indexPath.row)")
        cell!.textLabel?.text = "hogehoge"
        return cell!
    }
}
extension FirstViewController : UITableViewDelegate{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        imageView = cell?.imageView
        presentSecondView()
    }
}
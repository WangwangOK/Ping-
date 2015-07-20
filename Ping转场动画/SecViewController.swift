//
//  SecViewController.swift
//  Ping转场动画
//
//  Created by Vivien on 15/7/20.
//  Copyright (c) 2015年 wangwang. All rights reserved.
//

import UIKit

class SecViewController: UIViewController {
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func pop(sender: UIButton) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

}

//
//  ViewController.swift
//  仿58  两条线的 加载动画
//
//  Created by Xinxibin on 16/7/13.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let loadingView = XXBLoadingView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        loadingView.center = self.view.center
        self.view.addSubview(loadingView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


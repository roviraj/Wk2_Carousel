//
//  FeedViewController.swift
//  Wk2_Carousel
//
//  Created by Jaime Rovira on 10/27/14.
//  Copyright (c) 2014 Jaime Rovira. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = feedImageView.image!.size
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

}

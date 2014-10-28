//
//  TutorialViewController.swift
//  Wk2_Carousel
//
//  Created by Jaime Rovira on 10/26/14.
//  Copyright (c) 2014 Jaime Rovira. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        
        nextButton.alpha = 0
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        if (page == 3) {
            UIView.animateWithDuration(1, animations: { () -> Void in
                self.nextButton.alpha = 1
                self.pageControl.alpha = 0
            })
        }
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

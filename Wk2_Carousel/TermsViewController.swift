//
//  TermsViewController.swift
//  Wk2_Carousel
//
//  Created by Jaime Rovira on 10/27/14.
//  Copyright (c) 2014 Jaime Rovira. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let requestURL = NSURL(string: "https://www.dropbox.com/terms?mobile=1")
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Done(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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

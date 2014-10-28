//
//  IntroViewController.swift
//  Wk2_Carousel
//
//  Created by Jaime Rovira on 10/26/14.
//  Copyright (c) 2014 Jaime Rovira. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var introImageView: UIImageView!
    
    @IBOutlet weak var photo1: UIImageView!
    @IBOutlet weak var photo2: UIImageView!
    @IBOutlet weak var photo3: UIImageView!
    @IBOutlet weak var photo4: UIImageView!
    @IBOutlet weak var photo5: UIImageView!
    @IBOutlet weak var photo6: UIImageView!
    
    var images: [UIImageView]!
    
    var xOriginals: [CGFloat]!
    var yOriginals: [CGFloat]!
    var yOffsets : [CGFloat] = [-285, -260, -415, -408, -500, -500]
    var xOffsets : [CGFloat] = [-80, 20, 30, 60, -120, -80]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = introImageView.image!.size
        
        images = [photo1, photo2, photo3, photo4, photo5, photo6]
        
        xOriginals = [photo1.center.x, photo2.center.x, photo3.center.x, photo4.center.x, photo5.center.x, photo6.center.x]
        yOriginals = [photo1.center.y, photo2.center.y, photo3.center.y, photo4.center.y, photo5.center.y, photo6.center.y]
        
        scrollViewDidScroll(scrollView)
    }
    
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    func convertScroll(min: Float, max: Float) -> Float {
        var scrollY = Float(scrollView.contentOffset.y)
        return convertValue(scrollY, r1Min: 0.0, r1Max: 568.0, r2Min: min, r2Max: max)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        
        for(var i: Int = 0; i < 6; i++) {
            var view: UIImageView = images[i]
            
            var scale = convertScroll(scales[i], max: 1.0)
            var rotation = convertScroll(rotations[i], max: 0.0)
            
            var y = convertScroll(Float(yOriginals[i] + yOffsets[i]),
                max: Float(yOriginals[i]))
            var x = convertScroll(Float(xOriginals[i] + xOffsets[i]),
                max: Float(xOriginals[i]))
            
            applyTransforms(view, y: CGFloat(y), x: CGFloat(x),
                scale: CGFloat(scale), rotation: CGFloat(rotation))
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func applyTransforms(view: UIImageView, y: CGFloat, x: CGFloat, scale: CGFloat, rotation: CGFloat) {
        
        var rotationTransform = CGAffineTransformMakeRotation(rotation * CGFloat(M_PI/180))
        var scaleTransform = CGAffineTransformMakeScale(scale, scale)
        var transform = CGAffineTransformConcat(scaleTransform, rotationTransform)
        
        view.transform = transform
        view.center.x = x
        view.center.y = y
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

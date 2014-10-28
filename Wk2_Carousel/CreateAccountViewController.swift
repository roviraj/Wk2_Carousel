//
//  CreateAccountViewController.swift
//  Wk2_Carousel
//
//  Created by Jaime Rovira on 10/26/14.
//  Copyright (c) 2014 Jaime Rovira. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    var alertView: UIAlertView!
    
    @IBOutlet weak var formView: UIView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var checkboxButton: UIButton!
    
    
    @IBAction func Oncheckbox(sender: AnyObject) {
        checkboxButton.selected = !checkboxButton.selected
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        validateFields()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    @IBAction func backButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func keyboardWillShow(notification: NSNotification!) {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.formView.frame.origin.y = -5
            self.buttonView.frame.origin.y = 300
        
        })
    }

    func keyboardWillHide(notification: NSNotification!) {
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.formView.frame.origin.y = 74
            self.buttonView.frame.origin.y = 493
        })
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        validateFields()
    }
    

    func checkPassword() {
        alertView.dismissWithClickedButtonIndex(0, animated: true)
        
        if (emailField.text.lowercaseString == "tim@thecodepath.com" && passwordField.text.lowercaseString == "password") {
            performSegueWithIdentifier("createTutorialSegue", sender: self)
        } else {
            alertView = UIAlertView(title: "Sign In Failed", message: "Incorrect email or password.", delegate: self, cancelButtonTitle: "Try again")
            alertView.show()
        }
    }


    func validateFields() {
    }

    @IBAction func tapOff(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @IBAction func tapCreate(sender: AnyObject) {
        if (checkboxButton.selected == false) {
            alertView = UIAlertView(title: "You need to Accept the Terms of Service.", message: nil, delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        }
        else if (emailField.text.isEmpty) {
            alertView = UIAlertView(title: "Email Required", message: "Please enter an email address", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        } else if (passwordField.text.isEmpty) {
            alertView = UIAlertView(title: "Password Required", message: "Please enter a password", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        } else if (firstnameField.text.isEmpty) {
            alertView = UIAlertView(title: "First Name Required", message: "Please enter your first name", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        } else if (lastnameField.text.isEmpty) {
            alertView = UIAlertView(title: "Last Name Required", message: "Please enter your last name", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        } else {
            alertView = UIAlertView(title: "Creating account...", message: nil, delegate: self, cancelButtonTitle: nil)
            alertView.show()
            
        delay(2, { () -> () in
                self.checkPassword()
                self.alertView.dismissWithClickedButtonIndex(0, animated: true)
            })
        }
    }
}
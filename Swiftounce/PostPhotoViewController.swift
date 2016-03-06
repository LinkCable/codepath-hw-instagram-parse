//
//  PostPhotoViewController.swift
//  Swiftounce
//
//  Created by Philippe Kimura-Thollander on 3/6/16.
//  Copyright © 2016 Philippe Kimura-Thollander. All rights reserved.
//

import UIKit

class PostPhotoViewController: UIViewController {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var captionTextView: UITextView!
    var pickedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        postImageView.image = pickedImage
        let post = UIBarButtonItem(title: "Post", style: .Plain, target: self, action: Selector("postImage:"))
        self.navigationItem.rightBarButtonItem = post
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func postImage(sender: AnyObject) {
        print("on post")
        Post.postUserImage(postImageView.image, withCaption: captionTextView.text) { (complete: Bool, error:NSError?) -> Void in
            if complete == true {
                print("image posted")
                self.performSegueWithIdentifier("postedSegue", sender: nil)
            }
            else {
                print(error?.localizedDescription)
            }
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

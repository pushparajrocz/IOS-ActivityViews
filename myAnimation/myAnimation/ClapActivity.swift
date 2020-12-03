//
//  ClapActivity.swift
//  myAnimation
//
//  Created by Pushparaj Selvam on 04/12/20.
//

import UIKit

// Custom UIActivity
extension UIActivity.ActivityType{
    public static let clap = UIActivity.ActivityType(rawValue: "clap_clap")
}

//Custom Activity
class ClapActivity: UIActivity {
    var say = false
    var str = "Hlo"
    // Category of the activity
    // 2 types of category 1. share and 2. action
    override class var activityCategory: Category { return .share }
    // Type of the activity
    override var activityType:  ActivityType? { return .clap }
    // Title of the activity
    override var activityTitle: String? { return "Clap! Clap!" }
    // Background image of the activity icon
    override var activityImage: UIImage? { return UIImage(named: "berkay-gumustekin-ngqyo2AYYnE-unsplash") }
    // UIViewController which is returned when the custom activity icon is pressed
    override var activityViewController: UIViewController? {
        let view = UIViewController()
        let v1 = UIView()
        v1.backgroundColor = .yellow
        view.view = v1
        //let alert = UIAlertController(title: str, message: "Keep in touch", preferredStyle: .alert)
        //alert.addAction(UIAlertAction(title: "OK", style: .default) {
        //    [unowned self] action in
        //    alert.dismiss(animated: true)
        //    self.activityDidFinish(true)
        //})
        //return alert
        return view
    }
    // Custom activity is displayed only if this function returns true else wont display
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        // here custom activity is only for the image items in the set of activityitems
        for case is UIImage in activityItems{
            return true
        }
        return false
    }
    // Prepare things which works for the specific items
    override func prepare(withActivityItems activityItems: [Any]) {
        for case let image as UIImage in activityItems {
            say = true
        }
    }
    // This performs actual task asynchronously as backend work
    override func perform() {
        if say{
            self.activityDidFinish(true)}
        else{
            self.activityDidFinish(false)
        }
        
    }
}

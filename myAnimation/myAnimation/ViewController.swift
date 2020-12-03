//
//  ViewController.swift
//  myAnimation
//
//  Created by Pushparaj Selvam on 30/11/20.
//

import UIKit

final class ViewController: UIViewController {

    let url   = URL(string: "https://medium.com/@vialyx")
    let image = UIImage(named: "berkay-gumustekin-ngqyo2AYYnE-unsplash")

    override func loadView() {
        super.loadView()
        print("View Loaded !")
        // Custom Button for triggering custom UIActivity
        let actionB = UIButton(type: .custom)
        actionB.layer.cornerRadius = 3
        actionB.setTitle("Share me !?", for: UIControl.State())
        actionB.backgroundColor = UIColor(red: 0.09, green: 0.41, blue: 0.48, alpha: 1.00)
        actionB.frame = CGRect(x: 90, y: 100, width: 200, height: 80)
        // button trigger function
        actionB.addTarget(self, action: #selector(shareDidTap), for: .touchUpInside)
        view.addSubview(actionB)
    }

    // function for displaying UIAcitivityViewController or Share view
    @objc private func shareDidTap() {
        // applicationActivites: [set of custom UIActivity class]
        let activityVC = UIActivityViewController(activityItems: [url, image],
                                                  applicationActivities: [ClapActivity()])
        present(activityVC, animated: true)
    }
}



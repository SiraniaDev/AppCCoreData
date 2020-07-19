//
//  AnimationsViewController.swift
//  AppCCoreData
//
//  Created by Nadia Mettioui on 18/07/2020.
//  Copyright © 2020 Sirania'Dev. All rights reserved.
//

import UIKit

class AnimationsViewController: UIViewController {
    let titleLabel = UILabel()
    let bodyLabel = UILabel()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // view.backgroundColor = .yellow
        setupLabel()
        setupStackView()
        // Add Animations
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimation)))
    }
    // animation 1 tect boouge à gauche
    @objc fileprivate func handleTapAnimation() {
        print("OK")
        UIView.animate(withDuration : 0.5 ,delay:0,
                       usingSpringWithDamping: 0.5,initialSpringVelocity: 0.5,
                       options: .curveEaseOut,animations: {
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
                        
        }) { (_) in
            // animation 2 text va vers le haut
            UIView.animate(withDuration : 0.5 ,delay:0,
                           usingSpringWithDamping: 1,initialSpringVelocity: 1,
                           options: .curveEaseOut,animations: {
                self.titleLabel.alpha = 0
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
            
        })

            
      }
        
        UIView.animate(withDuration : 0.5 ,delay:0.5,
                         usingSpringWithDamping: 0.5,initialSpringVelocity: 0.5,
                         options: .curveEaseOut,animations: {
              self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
                          
          }) { (_) in
              // animation 2 text va vers le haut
            UIView.animate(withDuration : 0.5 ,delay:0.5,
                             usingSpringWithDamping: 1,initialSpringVelocity: 1,
                             options: .curveEaseOut,animations: {
                  self.bodyLabel.alpha = 0
                  self.bodyLabel.transform = self.bodyLabel.transform.translatedBy(x: 0, y: -200)
              
          })

        }
   
        
        
}
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    fileprivate func setupLabel() {
//        titleLabel.backgroundColor = .red
        titleLabel.font = UIFont(name: "Futura", size: 34)
        titleLabel.numberOfLines = 0
//        bodyLabel.backgroundColor = .green
        bodyLabel.numberOfLines = 0
        titleLabel.text = "Bienvenue à la Coding School Sirania'Dev"
        bodyLabel.text = "Body BodyBodyBodyBodyBody\nBodyBodyBodyBody\nBodyBodyBodyBodyBodyBody"
    }
    fileprivate func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel,bodyLabel])
        stackView.spacing = 8
        stackView.axis = .vertical
        //        stackView.frame = CGRect(x: 0, y: 0, width: 200, height: 400)
        view.addSubview(stackView)
        
        //enable autolayout
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -100).isActive = true
    }
    
    
    @IBAction func menuTapped(_ sender: Any) {
       let menuList =  MenuTableViewController(style: .grouped)
        self.navigationController?.show(menuList, sender: nil)
    }
}

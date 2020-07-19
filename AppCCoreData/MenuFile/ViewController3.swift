//
//  ViewController3.swift
//  AppCCoreData
//
//  Created by Nadia Mettioui on 18/07/2020.
//  Copyright © 2020 Sirania'Dev. All rights reserved.
//

import UIKit
import Gemini

class ViewController3: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    let photos = ["byte","playgroundFR","playground2","everyone"]

    @IBOutlet weak var myCollectionView: GeminiCollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.emailTextField.isEditing
//        self.emailTextField.isSelected
//        self.emailTextField.
       
        // Do any additional setup after loading the view.
//        myCollectionView.gemini
//           .rollRotationAnimation()
//           .degree(45)
//        .rollEffect(.rollUp)
        myCollectionView.gemini
        .scaleAnimation()
        .scale(0.75)
        .scaleEffect(.scaleUp)
    }
    

       // Call animation function
       func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.myCollectionView.animateVisibleCells()
       }

      


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gemCell", for: indexPath) as! MyCell
        
        cell.setCell(imageName: photos[indexPath.row])
            // animate the cell
        self.myCollectionView.animateCell(cell)
         
         return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
           // animate
              if let cell = cell as? MyCell {
                  self.myCollectionView.animateCell(cell)
              }
          }
}

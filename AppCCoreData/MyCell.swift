//
//  MyCell.swift
//  
//
//  Created by Nadia Mettioui on 19/07/2020.
//

import UIKit
import Gemini

class MyCell: GeminiCell {
    @IBOutlet weak var myImageView: UIImageView!
    func setCell(imageName: String){
        myImageView.image = UIImage(named: imageName)
    }
    
}

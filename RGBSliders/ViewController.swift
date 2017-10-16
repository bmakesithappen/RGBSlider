//
//  ViewController.swift
//  RGBSliders
//
//  Created by Bernard Désert on 9/25/17.
//  Copyright © 2017 Bernard Désert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // setting sliders and colorSquare as properties created through IBOutlets / Refrencing outlets:
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var colorSquare:UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let defaults = UserDefaults.standard
        redSlider.value = defaults.float(forKey: "red")
        greenSlider.value = defaults.float(forKey: "green")
        blueSlider.value = defaults.float(forKey: "blue")
        
        updateBackgroundColor()
        
        // assigning colorSquare's border and borderWidth
        colorSquare.layer.borderColor = UIColor.black.cgColor
        colorSquare.layer.borderWidth = 1
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // prepare method ethod passes in a segue parameter, which contains two useful properties: the identifier of the segue (in this case openColor), and the destination (in this case the second view controller).
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "openColor") {
            let newViewController = segue.destination // this is a reference to the second ViewController in a variable
            
        //   first ViewController tells the second ViewController to give its view the same background color as the color picker square:
            newViewController.view.backgroundColor = colorSquare.backgroundColor            }
        
    }
    @IBAction func updateBackgroundColor() {  // this func changes the background based on the values changed on the sliders
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        // setting the backgroundColor of the square with the colors set in this function updateBackgroundColor
        colorSquare.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha:1)
        
        // saves the selected color
        let defaults = UserDefaults.standard // 1
        defaults.set(redSlider.value, forKey: "red") // 2
        defaults.set(greenSlider.value, forKey: "green")
        defaults.set(blueSlider.value, forKey: "blue")
        defaults.synchronize() // 3
        
        /*
 
1.  First, you store a reference to the shared defaults object using the UserDefaults.standard method. The shared defaults object is where you can store all of your user preferences.
2.  You then store the three slider values within the shared defaults object linked to keys "red", "green", and "blue". Standard user defaults are stored locally at regular intervals.
 3 To be sure that the data is saved immediately, we call the synchronize method.

  */
 
    }

}


//
//  ViewController.swift
//  musicPlayer
//
//  Created by Julio Ahuactzin on 22/02/16.
//  Copyright © 2016 Julio Ahuactzin. All rights reserved.
//

import UIKit
import AVFoundation

    class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
        
    private var reproductor: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        myPicker.dataSource = self
        myPicker.delegate = self
        let sonidoURL = NSBundle.mainBundle().URLForResource("sweep1", withExtension: "mp3")
        do{
            try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
        } catch{
            print("Error de reproducccion")
        }
        //reproductor.play()
        myLabel.text = pickerData[0].sound

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
        
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet var myLabel: UILabel!
        
     @IBAction func playButton() {
        reproductor.play()
     }
    
    @IBAction func pauseButton() {
        reproductor.pause()
    }
        
    
    @IBAction func stopAction() {
        reproductor.stop()
        reproductor.currentTime = 0
    }
        
        
    @IBAction func sliderButton(sender: UISlider) {
        let selectedValue = Float(sender.value)
        reproductor.volume = selectedValue
        
    }
        
    
    @IBAction func randomButton() {
        let randomSound = pickerData[Int(arc4random()) % pickerData.count]
        myLabel.text = randomSound.sound
        myImage.image = UIImage(named: randomSound.image)
        let sonidoURL = NSBundle.mainBundle().URLForResource(randomSound.sound, withExtension: "mp3")
        do{
            try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
            reproductor.play()
        } catch{
            print("Error de reproducccion")
        }
        

    }
        
        
    @IBOutlet var myPicker: UIPickerView!
        let pickerData = [(sound:"sweep1", image: "laser1.jpg"), (sound: "sweep2", image: "laser2.jpg"), (sound: "raygun-01", image: "laser3.jpg"), (sound:"laser-01", image:"laser4.jpg"), (sound:"laser-02", image:"laser5.jpg")]
        
        //MARK: - Delegates and data sources
        //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
        
        //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row].0
    }
       
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            myLabel.text = pickerData[row].sound
            myImage.image = UIImage(named: pickerData[row].image)
            let sonidoURL = NSBundle.mainBundle().URLForResource(pickerData[row].sound, withExtension: "mp3")
            do{
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
                reproductor.play()
            } catch{
                print("Error de reproducccion")
            }

    }

}


//
//  ViewController.swift
//  QizPro
//
//  Created by Nguyen Van Nhuong on 16/03/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var audioplayer = AVAudioPlayer()
    var mang:Array<UInt32> = []
    
    @IBOutlet weak var lblTrue: UILabel!
    
    
    @IBOutlet weak var lblFalse: UILabel!
    
    @IBOutlet weak var lblNumberOne: UILabel!
    
    @IBOutlet weak var lblNumberTwo: UILabel!
    
    @IBOutlet weak var lblResult: UILabel!
    var a:Int = 0
    var b:Int = 0
    
    @IBOutlet weak var btnTwo: UIButton!
    
    @IBOutlet weak var btnOne: UIButton!
    
   
    @IBOutlet weak var btnThree: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                playmusic()
                setUP()
    }
    func playmusic() {
        let filepath = Bundle.main.url(forResource: "KichTinh-Dangcapnhat_mkkm", withExtension: ".mp3")
        do{
            audioplayer =  try AVAudioPlayer(contentsOf: filepath!)
            audioplayer.prepareToPlay()
            audioplayer.play()
    
        }catch{
            print("loi roi")
        }

    
    }
    
    func setUP(){
        let s1 = arc4random_uniform(10)
        let s2 = arc4random_uniform(10)
        lblNumberOne.text = String(s1)
        lblNumberTwo.text = String(s2)
        lblResult.text = "?"
        mang.append(s1 + s2)
        ramdom()
        mang.remove(at: 0)
        mang.insert(s1 + s2, at: Int(arc4random_uniform(3)))
        btnOne.setTitle(String(mang[0]), for: .normal)
        btnTwo.setTitle(String(mang[1]), for: .normal)
        btnThree.setTitle(String(mang[2]), for: .normal)
    
    }
    func ramdom()  {
       
        while mang.count < 3 {
            
            let numberRamdom = arc4random_uniform(10)
            var found = false
            for idex in 0..<mang.count {
                if mang[idex] == numberRamdom {
                    found = true
                    break
                }
            }
            if found == false {
                mang.append(numberRamdom)
            }

            
            
        }
       
            
        
    }
    
    
    @IBAction func abtnChose(_ sender: UIButton) {
        if Int(sender.currentTitle!)! == (Int(lblNumberOne.text!)! + Int(lblNumberTwo.text!)!){
            a += 1
            lblTrue.text = String(a)
            
        }else{
            b += 1
            lblFalse.text = String(b)
        }
        mang.removeAll()
        setUP()
        
    }
   
    

}

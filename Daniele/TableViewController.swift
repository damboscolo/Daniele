//
//  ViewController.swift
//  Daniele
//
//  Created by Daniele Boscolo on 11/06/17.
//  Copyright © 2017 Daniele Boscolo. All rights reserved.
//

import UIKit
import AudioToolbox

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var vibrationTimer = Timer()
    func vibrate(_ start: Bool) {
        if start {
            vibrationTimer.invalidate()
            vibrationTimer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: { (timer) in
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            })
        } else {
            vibrationTimer.invalidate()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                AudioServicesPlaySystemSound(1519) // Actuate `Peek` feedback (weak boom)
            case 1:
                AudioServicesPlaySystemSound(1520) // Actuate `Pop` feedback (strong boom)
            case 2:
                AudioServicesPlaySystemSound(1521) // Actuate `Nope` feedback (series of three weak booms)
            case 3:
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            default: break
            }
        }
        else if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                vibrate(true)
            case 1:
                vibrate(false)
            default: break
            }
        }
        else if indexPath.section == 2 {
            switch indexPath.row {
            case 0:
                let generator = UINotificationFeedbackGenerator()
                generator.prepare()
                generator.notificationOccurred(.success)
                
            case 1:
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.prepare()
                generator.impactOccurred()
            case 2:
                let generator = UISelectionFeedbackGenerator()
                generator.prepare()
                generator.selectionChanged()
            default: break
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


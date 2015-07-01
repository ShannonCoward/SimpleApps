//
//  BubbleViewController.swift
//  Bubbles
//
//  Created by Shannon Armon on 6/30/15.
//  Copyright (c) 2015 Shannon Armon. All rights reserved.
//

import UIKit
import AVFoundation

class BubbleViewController: UIViewController, AVCaptureAudioDataOutputSampleBufferDelegate {
    
    var audioSession = AVAudioSession()
    var audioDataOutput = AVCaptureAudioDataOutput()
    var audioCaptureSession = AVCaptureSession()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    

        audioSession.setCategory(AVAudioSessionCategoryRecord, error: nil)
        audioSession.setMode(AVAudioSessionModeMeasurement, error: nil)
        audioSession.setActive(true, error: nil)
        audioSession.setPreferredSampleRate(48000, error: nil)
        
        let myDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeAudio)
        let audioCaptureInput = AVCaptureDeviceInput(device: myDevice, error: nil)
        
        audioCaptureSession.addInput(audioCaptureInput)
        
        audioDataOutput.setSampleBufferDelegate(self, queue: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0))
        
        audioCaptureSession.addOutput(audioDataOutput)
        
        audioCaptureSession.startRunning()
        
    }
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, fromConnection connection: AVCaptureConnection!) {
        
        if let audioChannel = connection.audioChannels.first as? AVCaptureAudioChannel {
        
        let power = audioChannel.averagePowerLevel + 50
            
            println(power)
            
            if power < 35 {return} //<----Ends Funcion
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
//            
//               self.view.backgroundColor = UIColor(white: CGFloat(power / 50), alpha: 1.0)
                var bubble = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
                
                bubble.backgroundColor = UIColor.cyanColor()
                bubble.layer.cornerRadius = 20
                
                bubble.center = CGPoint(x: self.view.center.x, y: self.view.frame.height)
                
                self.view.addSubview(bubble)
                
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                
                    
                    let randomY = self.view.center.y - CGFloat((power - 35) * 10)
                    
                    bubble.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
                    
                }, completion: { (finished) -> Void in
                    
                
                    
                    bubble.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
                    
                        bubble.removeFromSuperview()
                
                })
                
            })
        
            
            
        }
        
        
    }
    
    func getRandomX() -> CGFloat {
    
    
    return CGFloat(arc4random_uniform(UInt32(view.frame.width)))
        
    }

}



//
//  ViewController.swift
//  Tanstagram
//
//  Created by Boxuan Zhu on 6/2/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    


    @IBOutlet var images: [UIImageView]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createGestures()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func saveToPhotosTapGesture(_ sender: UITapGestureRecognizer) {
        renderImage()
    }
    
    func renderImage() {
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        let image = renderer.image{(goTo) in view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)}
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(ViewController.renderComplete), nil)
    }
    
    func renderComplete(_image: UIImage, didFinishiSavingWithError error: Error?, contextInfo: UnsafeRawPointer){
        if let error = error{
            let alert = UIAlertController(title: "Something went wrong :(", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default))
            present(alert, animated: true)
        }
        else{
            
            let alert = UIAlertController(title: "Photo Saved!", message: "Your image has been saved to your camera roll", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default))
            present(alert, animated: true)
            
        }
        
    }
    //create gestures
    func createGestures(){
        for shape in images{
            let pinch = pinchGesture(imageView: shape)
            let pan = panGesture(imageView: shape)
            let rotate = rotationGesture(imageView: shape)
            shape.addGestureRecognizer(pinch)
            shape.addGestureRecognizer(pan)
            shape.addGestureRecognizer(rotate)
        }
    }
    
    
    // handle gestures
    func handlePinch(sender: UIPinchGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform)!.scaledBy(x: sender.scale, y: sender.scale)
        sender.scale = 1
    }
    
    func handlePan(sender: UIPanGestureRecognizer){
        let translation = sender.translation(in: self.view)
        if let view = sender.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
    func handleRotation(sender: UIRotationGestureRecognizer){
        sender.view?.transform = (sender.view?.transform)!.rotated(by: sender.rotation)
        sender.rotation = 0
    }
    
    //set gestures
    func pinchGesture(imageView: UIImageView) -> UIPinchGestureRecognizer {
        return UIPinchGestureRecognizer(target: self, action: #selector(ViewController.handlePinch))
    }

    func panGesture(imageView: UIImageView) -> UIPanGestureRecognizer{
        return UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan))
    }
    
    func rotationGesture(imageView: UIImageView) -> UIRotationGestureRecognizer{
        return UIRotationGestureRecognizer(target: self, action: #selector(ViewController.handleRotation))
    }

}


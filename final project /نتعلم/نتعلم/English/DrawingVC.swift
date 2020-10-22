//
//  DrawingVC.swift
//  نتعلم
//
//  Created by mariam alfoudari on 10/22/20.
//
//
import UIKit
import PencilKit
import PhotosUI

class DrawingVC: UIViewController, PKCanvasViewDelegate, PKToolPickerObserver {
    @IBOutlet weak var PencilFingerButtonItem: UIBarButtonItem!
    @IBOutlet weak var CanvasView: PKCanvasView!
    
    
    let canvasWidth: CGFloat = 768
    let canvasOverScrollHight: CGFloat = 500
    var drawing = PKDrawing()
    
    override func viewDidLoad(){
      super.viewDidLoad()
        
        title = "ابدع و ارسم!"
        
       CanvasView.delegate = self
        CanvasView.drawing = drawing
        CanvasView.alwaysBounceVertical = true
        CanvasView.allowsFingerDrawing = true
        
        if let window = parent?.view.window,
           let toolPicker = PKToolPicker.shared(for: window) {
            toolPicker.setVisible(true, forFirstResponder: CanvasView)
            toolPicker.addObserver(CanvasView)
            
            CanvasView.becomeFirstResponder()
}
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let canvasScale = CanvasView.bounds.width / canvasWidth
        CanvasView.minimumZoomScale = canvasScale
        CanvasView.maximumZoomScale = canvasScale
        CanvasView.zoomScale = canvasScale
        
        updateContentSizeForDrawing()
        CanvasView.contentOffset = CGPoint(x: 0, y: -CanvasView.adjustedContentInset.top)
    }
    override var prefersHomeIndicatorAutoHidden: Bool{
        return true
    }
    @IBAction func toogleFingerOrPencil (_ sender: Any){
        CanvasView.allowsFingerDrawing.toggle()
        PencilFingerButtonItem.title = CanvasView.allowsFingerDrawing ? "ارسم" : "انظر الى ابداعك"
    }
    @IBAction func SaveDrawingToCameraRoll(_ sender: Any) {
        UIGraphicsBeginImageContextWithOptions(CanvasView.bounds.size, false, UIScreen.main.scale)
        
        CanvasView.drawHierarchy(in: CanvasView.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if image != nil {
            PHPhotoLibrary.shared().performChanges({PHAssetChangeRequest.creationRequestForAsset(from: image!)}, completionHandler: {success, error in
                // deal with succes or error
                
            })
            
        }
            }
    
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        updateContentSizeForDrawing()
    }
    
    func updateContentSizeForDrawing() {
        let drawing = CanvasView.drawing
        let contentHeight: CGFloat
        if !drawing.bounds.isNull {
            contentHeight = max(CanvasView.bounds.height, (drawing.bounds.maxY + self.canvasOverScrollHight) * CanvasView.zoomScale)
        }else{
            contentHeight = CanvasView.bounds.height
        }
        CanvasView.contentSize = CGSize(width: canvasWidth * CanvasView.zoomScale,
                                        height: contentHeight)
    }
    
}

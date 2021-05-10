//
//  postArrestVC.swift
//  codeBlue
//
//  Created by Dylan Neel on 10/20/20.
//  Copyright © 2020 Dylan Neel. All rights reserved.
//

import UIKit

class postArrestVC: UIViewController, UIScrollViewDelegate {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 5.0
        scrollView.contentSize = .init(width: 2000, height: 2000)
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    func updateZoomFor(size: CGSize){
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        let scale = min(widthScale,heightScale)
        scrollView.minimumZoomScale = scale
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

   

}

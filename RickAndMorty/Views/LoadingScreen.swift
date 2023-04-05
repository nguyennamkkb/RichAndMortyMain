//
//  LoadingScreen.swift
//  RickAndMorty
//
//  Created by cvcuong on 05/04/2023.
//

import Foundation

// Import necessary libraries
import UIKit

// Create a custom class for the loading screen
class LoadingScreen {
    
    // Create a static instance of the loading screen
    static let shared = LoadingScreen()
    
    // Create a private variable to hold the loading view
    private var loadingView: UIView?
    
    // Function to show the loading screen
    func show() {
        // Get the root view controller
        guard let viewController = UIApplication.shared.keyWindow?.rootViewController else {
            return
        }
        
        // Create the loading view
        let loadingView = UIView(frame: viewController.view.bounds)
        loadingView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        // Create the activity indicator
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.center = loadingView.center
        activityIndicator.startAnimating()
        
        // Add the activity indicator to the loading view
        loadingView.addSubview(activityIndicator)
        
        // Add the loading view to the root view controller
        viewController.view.addSubview(loadingView)
        
        // Set the loading view to the private variable
        self.loadingView = loadingView
    }
    
    // Function to hide the loading screen
    func hide() {
        // Remove the loading view from the superview
        loadingView?.removeFromSuperview()
        
        // Set the loading view to nil
        loadingView = nil
    }
}

// To use the loading screen, simply call the show() function to show the loading screen and the hide() function to hide it.
// For example:
// LoadingScreen.shared.show()
// LoadingScreen.shared.hide()

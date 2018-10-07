//
//  FlightInterfaceController.swift
//  Watch Extension
//
//  Created by Macbook on 10/7/18.
//  Copyright © 2018 MCC.edu. All rights reserved.
//


import WatchKit
import Foundation


class FlightInterfaceController: WKInterfaceController {
  
  @IBOutlet var flightLabel: WKInterfaceLabel!
  @IBOutlet var routeLabel: WKInterfaceLabel!
  @IBOutlet var boardingLabel: WKInterfaceLabel!
  @IBOutlet var boardTimeLabel: WKInterfaceLabel!
  @IBOutlet var statusLabel: WKInterfaceLabel!
  @IBOutlet var gateLabel: WKInterfaceLabel!
  @IBOutlet var seatLabel: WKInterfaceLabel!
  
  
  var flight: Flight? {
    // didSet observer that sets the label text
    didSet {
      // Set the label text only if flight is not nil
      if let flight = flight {
        flightLabel.setText("Flight \(flight.shortNumber)")
        routeLabel.setText(flight.route)
        boardingLabel.setText("\(flight.number) Boards")
        boardTimeLabel.setText(flight.boardsAt)
        if flight.onSchedule {
          statusLabel.setText("On Time")
        } else {
          statusLabel.setText("Delayed")
          statusLabel.setTextColor(UIColor.red)
        }
        gateLabel.setText("Gate \(flight.gate)")
        seatLabel.setText("Seat \(flight.seat)")
      }
    }
  }
  
  // Initialize this interface control with data contained in the specified context
  override func awake(withContext context: Any?) {
    super.awake(withContext: context)
    
    flight = Flight.allFlights().first!
  }
}

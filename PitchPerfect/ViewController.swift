//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Kostiantyn Bilyk on 25.11.17.
//  Copyright © 2017 Kostiantyn Bilyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        stopButton.isEnabled = false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear called!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordButtonAction(_ sender: UIButton) {
        statusLabel.text = "Recording in Progress..."

        stopButton.isEnabled = true
        recordButton.isEnabled = false
    }

    @IBAction func stopButtonAction(_ sender: UIButton) {
        statusLabel.text = "Tap to Record"

        stopButton.isEnabled = false
        recordButton.isEnabled = true
    }
}


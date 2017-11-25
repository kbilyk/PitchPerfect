//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Kostiantyn Bilyk on 25.11.17.
//  Copyright © 2017 Kostiantyn Bilyk. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController {

    var audioRecorder : AVAudioRecorder!

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

    @IBAction func recordButtonAction(_ sender: UIButton) {
        statusLabel.text = "Recording in Progress..."

        stopButton.isEnabled = true
        recordButton.isEnabled = false

        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))

        print(filePath as Any ?? "N/A")
 
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)

        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }

    @IBAction func stopButtonAction(_ sender: UIButton) {
        statusLabel.text = "Tap to Record"

        stopButton.isEnabled = false
        recordButton.isEnabled = true

        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
}


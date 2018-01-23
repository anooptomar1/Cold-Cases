//
//  EvidenceBoxViewController.swift
//  Cold Case
//
//  Created by Bradley Cupp on 10/16/17.
//  Copyright © 2017 DoublVision. All rights reserved.
//

import UIKit
import ARKit

class EvidenceBoxViewController: UIViewController, ARSCNViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    //Reference to current case object
    var currentCase: ColdCase!
    @IBOutlet weak var hideShowButton: UIButton!
    var itemsArray: [EvidenceBoxARObject]! = nil
    //Link to AR View
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    //Initialize AR World Tracking config
    //Used to track the position and orientation of device at all times
    let configuration = ARWorldTrackingConfiguration()
    var selectedItem: String?
    
    var firstTimeEvidenceBoxOpened: Bool!
    var firstTimeEvidenceBoxOpenedDefault = UserDefaults.standard
    
    
    
    //START VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsArray = currentCase.evidenceBox.evidenceObjectsAR
        
        //Debugging
        //showFeaturePoints displays yellow dots showing where the flat surfaces are
        //showWorldOrigin saves the start location of the device as a 3 axis chart
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        //Sets configuration to detect horizontal planes
        self.configuration.planeDetection = .horizontal
        //Runs ARWorldTrackingConfiguration session
        self.sceneView.session.run(configuration)
        //Activates datasource functions
        self.itemsCollectionView.dataSource = self
        //
        self.itemsCollectionView.delegate = self
        //Runs the following function
        self.registerGestureRecognizers()
        //Enabled light in all directions
        self.sceneView.autoenablesDefaultLighting = true
        
        
        //UserDefaults to mark case as started or not started
        if firstTimeEvidenceBoxOpenedDefault.value(forKey: "firstTimeOpenedEvidence") == nil {
            firstTimeEvidenceBoxOpened = firstTimeEvidenceBoxOpenedDefault.bool(forKey: "firstTimeOpenedEvidence") as Bool!
        }

        
     }//END VIEWDIDLOAD
    
    override func viewDidAppear(_ animated: Bool) {
        if firstTimeEvidenceBoxOpened == false && currentCase.caseIndex == 1 {
            firstTimeEvidenceBoxOpenedDefault.set(true, forKey: "firstTimeOpenedEvidence")
            firstTimeEvidenceBoxOpened = true
            performSegue(withIdentifier: "evidenceBoxToEvidenceBoxHelp", sender: self)
            
        }
    }
    
    
    
    //Sends the action(tapped) information on what was tapped
    func registerGestureRecognizers() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.sceneView.addGestureRecognizer(tapGestureRecognizer)

        //gesture recognizer to rotate AR object on long press
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(rotate))
        //It takes 0.1 seconds for the longPress rotation to commence
        longPressGestureRecognizer.minimumPressDuration = 0.1
        self.sceneView.addGestureRecognizer(longPressGestureRecognizer)
        
    }
    
    //function that rotates the object on long press
    @objc func rotate(sender: UILongPressGestureRecognizer) {
        let sceneView = sender.view as! ARSCNView
        
        //
        let holdLocation = sender.location(in: sceneView)
        
        //hitTest checks to see if you are touching an AR Object
        let hitTest = sceneView.hitTest(holdLocation)
        
        //If hittest is not empty
        if !hitTest.isEmpty {
            let result = hitTest.first

            if sender.state == .began {
                //rotate node 360 degrees. It takes 2 second to rotate the full 360
                let rotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 2)
                let forever = SCNAction.repeatForever(rotation)
                result?.node.runAction(forever)
            } else if sender.state == .ended {
                result?.node.removeAllActions()
            }
        }
    }
    
    
    
    @objc func tapped(sender: UITapGestureRecognizer) {
        let sceneView = sender.view as! ARSCNView
        let tapLocation = sender.location(in: sceneView)
        //Check if the location you tapped matches the location of a horizontal surface plane
        let hitTest = sceneView.hitTest(tapLocation, types: .existingPlaneUsingExtent)
        if !hitTest.isEmpty {
            self.addItem(hitTestResult: hitTest.first!)
        }
    }
    
    //called whenever you tap on a horizontal surface
    func addItem(hitTestResult: ARHitTestResult) {
        //If the user did select an item to place
        if let selectedItem = self.selectedItem {
            //selects the model located in the folder named after the selectedItem
            let scene = SCNScene(named: "Models.scnassets/\(selectedItem)/\(selectedItem).scn")
            //Assigned node to the model selected above
            let node = scene?.rootNode.childNode(withName: selectedItem, recursively: false)
            //Encodes position of the detected horizontal surface
            let transform = hitTestResult.worldTransform
            let thirdColumn = transform.columns.3
            //position the node right where the detected surface is
            node?.position = SCNVector3(thirdColumn.x, thirdColumn.y, thirdColumn.z)
            //Add item to scene view
            self.sceneView.scene.rootNode.addChildNode(node!)
        }
    }
    
    
    
    
    //Number of cells the collection view displays
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    //Datasource function that configures every cell in the collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //DequeueReusable cell returns a cell type based on the identifier
        //withReuseIdentifier refers to which cell identifier you are using
        //Index path indicates which cell you clicked on
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! itemCell
        //changes cell label to use the itemsArray name for the current indexPath
        cell.itemLabel.text = self.itemsArray[indexPath.row].objectName
        return cell
    }
    
    //Triggered when selecting a cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        self.selectedItem = itemsArray[indexPath.row].objectName
        cell?.backgroundColor = UIColor.orange
    }
    
    //Command telling the cell what to do when deselecting it
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.brown
    }

    
    @IBAction func hideShowCollectionView(_ sender: Any) {
        if !itemsCollectionView.isHidden {
            print("hide")
            hideShowButton.setTitle("Show", for: .normal)
            itemsCollectionView.isHidden = true
        } else {
            print("show")
            hideShowButton.setTitle("Hide", for: .normal)
            itemsCollectionView.isHidden = false
        }
    }
    
    
    


    @IBAction func backButton(_ sender: Any) {
        performSegueToReturnBack()
    }
}

//Extension to convert Degrees to Radians
extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/180 }
}

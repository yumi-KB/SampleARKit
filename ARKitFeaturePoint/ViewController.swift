//
//  ViewController.swift
//  ARKitFeaturePoint
//
//  Created by yumi kanebayashi on 2021/01/12.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Set the view's delegate
        sceneView.delegate = self
        
        /// Set the scene to the view
        sceneView.scene = SCNScene()

        /// 特徴点を追加する
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showCameras]
        
        /// ライトの追加
        sceneView.autoenablesDefaultLighting = true;

        /// コンフィギュレーション(配置)の作成
        // 現実世界をトラッキングする配置・構成
        let configuration = ARWorldTrackingConfiguration()
        
        /// 平面検出
        configuration.planeDetection = .horizontal

        /// セッションの開始
        sceneView.session.run(configuration)

    }
    
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        // Create a session configuration
//        let configuration = ARWorldTrackingConfiguration()
//
//        // Run the view's session
//        sceneView.session.run(configuration)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        // Pause the view's session
//        sceneView.session.pause()
//    }
    
}

// MARK: - ARSCNViewDelegate
    
extension ViewController: ARSCNViewDelegate {
    
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        /// 球のノードのインスタンスを作成
        let sphereNode = SCNNode()
        
        /// ノードにGeometryとTransformを設定
        sphereNode.geometry = SCNSphere(radius: 0.05)
        sphereNode.position.y += Float(0.05)
        
        /// 検出面の小要素にする
        node.addChildNode(sphereNode)
    }

//
//    func session(_ session: ARSession, didFailWithError error: Error) {
//        // Present an error message to the user
//
//    }
//
//    func sessionWasInterrupted(_ session: ARSession) {
//        // Inform the user that the session has been interrupted, for example, by presenting an overlay
//
//    }
//
//    func sessionInterruptionEnded(_ session: ARSession) {
//        // Reset tracking and/or remove existing anchors if consistent tracking is required
//
//    }
}

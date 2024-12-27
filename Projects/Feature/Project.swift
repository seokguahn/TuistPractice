//
//  Project.swift
//  Manifests
//
//  Created by iOS_Hwik on 12/2/24.
//

import ProjectDescription

let project = Project(
    name: "CommonUI",
    targets: [
        .target(
            name: "CommonUI",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "io.tuist.CommonUI",
            deploymentTargets: .iOS("16.0"),
            sources: ["Sources/**"],
            dependencies: []
        )
    ]
)

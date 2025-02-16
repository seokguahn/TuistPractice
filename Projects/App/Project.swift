import ProjectDescription

let project = Project(
    name: "TuistPractice",
    targets: [
        .target(
            name: "TuistPractice",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.TuistPractice",
            deploymentTargets: .iOS("16.0"),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                    "NSLocationAlwaysUsageDescription": "App_Name requires user’s location for better user experience.",
                    "NSLocationWhenInUseUsageDescription": "App_Name requires user’s location for better user experience.",
                    "NSLocationAlwaysAndWhenInUseUsageDescription": "App_Name requires user’s location for better user experience."
                ]
            ),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .project(target: "CommonUI", path: "../Feature"),
                .external(name: "ComposableArchitecture")
            ]
        ),
        .target(
            name: "TuistPracticeTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.TuistPracticeTests",
            deploymentTargets: .iOS("16.0"),
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            dependencies: [.target(name: "TuistPractice")]
        ),
    ]
)

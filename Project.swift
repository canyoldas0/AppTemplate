import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

/*
                +-------------+
                |             |
                |     App     | Contains WordWise App target and WordWise unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

let project = Project(
    name: "WordWise",
    organizationName: "can.yoldas",
    targets: [
        .mainTarget,
        .wordWiseUI
    ]
)

 extension Target {
    static let wordWiseUI = Target(name: "WordWiseUI",
                                   platform: .iOS,
                                   product: .framework,
                                   bundleId: "io.tuist.wordwiseui",
                                   infoPlist: .default,
                                   sources: ["Targets/WordWiseUI/Sources/**"],
                                   resources: [],
                                   dependencies: [])

     static let mainTarget =  Target(name: "WordWise",
                                     platform: .iOS,
                                     product: .app,
                                     bundleId: "com.canyoldas.wordwise",
                                     infoPlist: .defaultWithExtension,
                                     sources: ["Targets/WordWise/Sources/**"],
                                     resources: ["Targets/Wordwise/Resources/**"],
                                     dependencies: [.external(name: "Cwifty")]
     )
}

extension InfoPlist {
    static let defaultWithExtension: InfoPlist = .extendingDefault(with: [
        "CFBundleShortVersionString": "1.0",
        "CFBundleVersion": "1",
        "UIMainStoryboardFile": "",
        "UILaunchStoryboardName": "LaunchScreen"
    ])
}

import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

let project = Project(
    name: "WordWise",
    organizationName: "can.yoldas",
    targets: [
        .mainTarget,
        .wordWiseUI,
        .utils
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
                                   dependencies: [.target(.utils)])

     static let mainTarget =  Target(name: "WordWise",
                                     platform: .iOS,
                                     product: .app,
                                     bundleId: "com.canyoldas.wordwise",
                                     infoPlist: .defaultWithExtension,
                                     sources: ["Targets/WordWise/Sources/**"],
                                     resources: ["Targets/WordWise/Resources/**"],
                                     dependencies: [.external(name: "Cwifty"), .target(.wordWiseUI), .target(.utils)]
     )

     static let utils = Target(name: "WordWiseUtils",
                                platform: .iOS,
                                product: .framework,
                                bundleId: "io.tuist.wordwise.utils",
                                infoPlist: .default,
                                sources: ["Targets/WordWiseUtils/Sources/**"],
                                resources: ["Targets/WordWiseUtils/Resources/**"],
                                dependencies: [])
}

extension InfoPlist {
    static let defaultWithExtension: InfoPlist = .extendingDefault(with: [
        "CFBundleShortVersionString": "1.0",
        "CFBundleVersion": "1",
        "UIMainStoryboardFile": "",
        "UILaunchStoryboardName": "LaunchScreen"
    ])
}

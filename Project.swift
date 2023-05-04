import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

let project = Project(
    name: "<App Name>", // App's name
    organizationName: "", // Organization name
    targets: [
        .mainTarget,
        .appUI,
        .utils
    ]
)

 extension Target {
    static let appUI = Target(name: "AppUI",
                                   platform: .iOS,
                                   product: .framework,
                                   bundleId: "io.tuist.app-ui",
                                   infoPlist: .default,
                                   sources: ["Targets/AppUI/Sources/**"],
                                   resources: [],
                                   dependencies: [.target(.utils)])

     static let mainTarget =  Target(name: "App",
                                     platform: .iOS,
                                     product: .app,
                                     bundleId: "com.canyoldas.wordwise",
                                     infoPlist: .defaultWithExtension,
                                     sources: ["Targets/App/Sources/**"],
                                     resources: ["Targets/App/Resources/**"],
                                     dependencies: [.target(.appUI), .target(.utils)]
     )

     static let utils = Target(name: "AppUtils",
                                platform: .iOS,
                                product: .framework,
                                bundleId: "io.tuist.app.utils",
                                infoPlist: .default,
                                sources: ["Targets/AppUtils/Sources/**"],
                                resources: ["Targets/AppUtils/Resources/**"],
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

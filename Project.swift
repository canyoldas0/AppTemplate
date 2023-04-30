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

// Creates our project using a helper function defined in ProjectDescriptionHelpers
let project = Project.app(
    name: "WordWise",
    platform: .iOS,
    additionalTargets: ["WordWiseUI"])

let project = Project(
    name: "WordWise",
    organizationName: "can.yoldas",
    packages: [.],
    settings: <#T##Settings?#>,
    targets: <#T##[Target]#>,
    schemes: <#T##[Scheme]#>,
    fileHeaderTemplate: <#T##FileHeaderTemplate?#>,
    additionalFiles: <#T##[FileElement]#>,
    resourceSynthesizers: <#T##[ResourceSynthesizer]#>
)

# iOS-sdk
iOS-SDK for Dexecure.

Dexecure’s asset optimizer compresses media assets automatically with zero configuration based on the device, operating system and the network the user is on.

# CocoaPods
To integerate Dexecure into your Xcode project using Cocoapods , specify it in your Podfile:

pod 'Dexecure' , '~> 0.0.1'

and in your code add import Dexecure.

# Carthage 

To integrate Dexecure into your Xcode project using Carthage, specify it in your Cartfile:

github "Dexecure/iOS-sdk" ~> 0.0.1


# Manually

you can integrate Dexecure into your project manually.

* Embedded Framework
  Open up Terminal, cd into your top-level project directory, and run the following command "if" your project is not        initialized as a git repository:
  
  $ git init
  
* Add Dexecure as a git submodule by running the following command:

$ git submodule add https://github.com/Dexecure/iOS-sdk.git

* Open the new Dexecure folder, and drag the Dexecure.xcodeproj into the Project Navigator of your application's Xcode project.

It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode  groups does not matter.

* Select the Dexecure.xcodeproj in the Project Navigator and verify the deployment target matches that of your application   target.

* Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.

* In the tab bar at the top of that window, open the "General" panel.

* Click on the + button under the "Embedded Binaries" section.

* You will see two different Dexecure.xcodeproj folders each with two different versions of the Dexecure.framework nested inside a Products folder.

* It does not matter which Products folder you choose from, but it does matter whether you choose the top or bottom Dexecure.framework.

* Select the top Dexecure.framework.

* You can verify which one you selected by inspecting the build log for your project. The build target for Dexecure will be listed.

And that's it!

The Dexecure.framework is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.

# Usage

The Dexecure Swift client is compatible with Swift 4.2.

// Import the framework

   import Dexecure

// Set up an ImgixClient

   let client = Dexecure.init(host: "beek.dexecure.net")

// Build a basic URL

  client.buildUrl("/proxy/http://demos.imgix.net/bridge.png") // =>  https://beek.dexecure.net/proxy/http://demos.imgix.net/bridge.png

// Add some parameters

  client?.buildUrl("/proxy/http://demos.imgix.net/bridge.png", params: [Constants.Key.height : "200"]) // => http://beek.dexecure.net/proxy/http://demos.imgix.net/bridge.png?resize=h200


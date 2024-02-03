# Build app - take source code, config files, assets and compile it into an executable
build:
    xcodebuild -scheme terminal23 -destination 'platform=iOS Simulator,name=iPhone 15,OS=latest' SYMROOT="/Users/hyzyla/Developer/terminal23-ios/terminal23/.build"  clean build

# Install app on simulator (run emulator first)
install:
    xcrun simctl install booted .build/Debug-iphonesimulator/terminal23.app/

# Run app on simulator (run emulator first)
run:
    xcrun simctl launch booted dev.hyzyla.terminal23

# Build and run app on simulator in one command
build-and-run: build install run


# Show available schemes
show-schemes:
    xcodebuild -list

# Show available simulators
show-emulators:
    xcrun simctl list devices available

# Start emulator
start-emulator:
    open -a Simulator

regenerate-xcodeproj:
    rm -rf terminal23.xcodeproj
    xcodegen generate

try: regenerate-xcodeproj build-and-run

xcode-build-server:
    xcode-build-server config -workspace terminal23.xcodeproj/project.xcworkspace -scheme terminal23

build-server:
    rm -rf .bundle .bundle.xcresult; xcodebuild -workspace terminal23.xcodeproj/project.xcworkspace  -scheme terminal23 -destination 'generic/platform=iOS Simulator' -resultBundlePath .bundle build
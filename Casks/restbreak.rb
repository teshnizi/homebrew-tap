cask "restbreak" do
  version "1.0"
  sha256 "960e74e7b99830b2c9d055a24b2d355a2bcda2686084be058e025aedc1d8933e"

  url "https://github.com/teshnizi/RestBreak/releases/download/v#{version}/RestBreak.zip"
  name "RestBreak"
  desc "Menu bar break reminder for your eyes, neck and posture"
  homepage "https://github.com/teshnizi/RestBreak"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "RestBreak.app"

  # RestBreak is not notarized by Apple: without this, macOS blocks the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/RestBreak.app"]
  end

  uninstall quit: "com.restbreak.app"

  zap trash: "~/Library/Preferences/com.restbreak.app.plist"
end

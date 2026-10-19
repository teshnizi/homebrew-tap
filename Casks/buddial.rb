cask "buddial" do
  version "0.12"
  sha256 "fcb460895b7283be803d060c863fce980a428779ac7b8fa63db9fc389cd71139"

  url "https://github.com/teshnizi/BudDial/releases/download/v#{version}/BudDial.zip"
  name "BudDial"
  desc "Dictate into any app by holding an AirPod"
  homepage "https://github.com/teshnizi/BudDial"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "BudDial.app"

  # BudDial is signed but not notarized by Apple: without this, macOS blocks the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/BudDial.app"]
  end

  uninstall quit: "dev.buddial"

  zap trash: "~/Library/Application Support/BudDial"
end

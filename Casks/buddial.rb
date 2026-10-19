cask "buddial" do
  version "0.11"
  sha256 "222edf4bfdc5ad3515a3377462ee3c5a5634d89882c5f8ddea6a0f002643d561"

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

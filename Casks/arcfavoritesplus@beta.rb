cask "arcfavoritesplus@beta" do
  version "1.1.0-beta.1" # bump this on every beta tag you push
  sha256 "REPLACE_ME_WITH_SHA256_FROM_RELEASE_WORKFLOW_OUTPUT"

  url "https://github.com/alpha-neutr0n/arcfavoritesplus-releases/releases/download/v#{version}/ArcFavoritesPlus.zip"
  name "Arc Favorites+ (Beta)"
  desc "Pre-release build of Arc Favorites+ — for testing before it's promoted to stable"
  homepage "https://github.com/alpha-neutr0n/arcfavoritesplus-releases"

  app "ArcFavoritesPlus.app"

  # Conflicts with the stable cask on purpose — installing both at
  # once would mean two instances fighting over the same menu bar
  # icon, LaunchAgent label, and port 8765.
  conflicts_with cask: "arcfavoritesplus"

  zap trash: [
    "~/Library/Application Support/ArcFavoritesApp",
    "~/Library/LaunchAgents/com.arcfavoritesplus.app.plist",
    "~/Library/Preferences/com.arcfavoritesplus.app.plist"
  ]

  caveats <<~EOS
    This is a pre-release build for testing, not the stable release.
    `brew uninstall --cask arcfavoritesplus@beta` before installing
    the stable `arcfavoritesplus` cask.
  EOS
end

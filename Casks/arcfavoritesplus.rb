cask "arcfavoritesplus" do
  version "1.0.0" # bump this on every stable release
  sha256 "REPLACE_ME_WITH_SHA256_FROM_RELEASE_WORKFLOW_OUTPUT"

  url "https://github.com/alpha-neutr0n/arcfavoritesplus-releases/releases/download/v#{version}/ArcFavoritesPlus.zip"
  name "Arc Favorites+"
  desc "Unlimited favorites for Arc browser, past its 12-pin limit (free tier: 5)"
  homepage "https://alpha-neutr0n.github.io/arcfavoritesplus-releases/"

  # Ad-hoc signed, not notarized (see README) — installing via `brew`
  # means this is downloaded with curl, not a browser, so it never
  # gets the quarantine flag that would otherwise trigger Gatekeeper's
  # "Apple could not verify this app" block.
  app "ArcFavoritesPlus.app"

  zap trash: [
    "~/Library/Application Support/ArcFavoritesApp",
    "~/Library/LaunchAgents/com.arcfavoritesplus.app.plist",
    "~/Library/Preferences/com.arcfavoritesplus.app.plist"
  ]

  caveats <<~EOS
    Arc Favorites+ starts automatically at login and lives in the menu
    bar (look for the ★ icon).

    To capture favorites from Arc, install the browser extension and
    pair it with the pairing token shown in the app's menu (★ → Copy
    Pairing Token).
  EOS
end

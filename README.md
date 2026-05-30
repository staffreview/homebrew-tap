# Staff Review — Homebrew tap

Homebrew formula for [**Staff Review**](https://github.com/staffreview/staffreview),
a local, staff‑engineer‑grade code review tool with AI‑coding‑agent skills.

## Install

```bash
brew install staffreview/tap/staff
staff --version
```

(`staffreview/tap` resolves to this repo, `github.com/staffreview/homebrew-tap`.)

## Cutting a release (maintainers)

The formula installs a prebuilt, self‑contained binary from a GitHub Release on
the main repo. To ship a new version:

1. **Build** all four binaries from the main repo:
   ```bash
   cd apps/staffreview && bun run build:all
   # → dist/staff-darwin-arm64, staff-darwin-x64, staff-linux-x64, staff-linux-arm64
   ```
2. **Hash** them:
   ```bash
   shasum -a 256 dist/staff-darwin-arm64 dist/staff-darwin-x64 \
                 dist/staff-linux-x64 dist/staff-linux-arm64
   ```
3. **Release**: create a GitHub Release tagged `vX.Y.Z` on
   `staffreview/staffreview` and upload those four binaries as assets
   (asset names must stay `staff-<os>-<arch>`).
4. **Update** `Formula/staff.rb`: bump `version` and paste the four `sha256`
   values, then commit and push this repo.
5. **Verify**: `brew update && brew install staffreview/tap/staff`.

> The `sha256` values in `Formula/staff.rb` match the **v0.1.0** binaries. They
> only resolve once a `v0.1.0` release exists on `staffreview/staffreview` with
> those exact assets uploaded.

# PSWriteHTML

PowerShell module that builds HTML reports, dashboards and emails (tables,
charts, diagrams, calendars, tabs, navigation) without writing HTML, CSS or
JavaScript. Runs on Windows PowerShell 5.1 and PowerShell 7 on Windows, Linux
and macOS.

## Layout

- `Public/`: exported functions, one function per file.
- `Private/`: internal helpers. `Private/Parameters.Configuration.ps1`
  (`Get-DefaultParameters`) registers every CSS/JS feature and its sources.
- `Resources/CSS`, `Resources/JS`, `Resources/Images`, `Resources/Maps`: the
  bundled third-party and own assets embedded into offline reports.
- `Tests/`: Pester tests, run through `PSWriteHTML.Tests.ps1` at the root.
  `Tests/Browser/`: headless Edge navigation checks (see Gotchas).
- `Examples/`: runnable examples. Output under `Examples/Output`, `Examples/Reports`
  and `*.html` is ignored.
- `Build/Build-Module.ps1`: build, docs and release through PSPublishModule.
- `Build/Export-WebsiteArtifacts.ps1` and `Website/content/`: curated content for
  the project's website page (see `Website/README.md`).
- `Docs/`: generated command help.

## Build and test

```powershell
./PSWriteHTML.Tests.ps1                                       # Pester suite (installs Pester, PSWriteColor, PSParseHTML if missing)
./Build/Build-Module.ps1                                      # build into Artefacts/ and regenerate Docs/
./Build/Build-Module.ps1 -ConfigurationGateMode Manifest      # manifest-only gate
./Build/Export-WebsiteArtifacts.ps1                           # website API artifacts into WebsiteArtifacts/ (ignored)
```

`-ConfigurationGateMode Publish` signs the module and is release-only.

CI (`.github/workflows/ci.yml`) runs the suite on Windows PowerShell 5.1 and on
PowerShell 7 on Windows, Ubuntu and macOS.

## Generated files

- `Docs/*.md` and `en-US/PSWriteHTML-help.xml` (ignored) come from the
  comment-based help in `Public/`. Edit the help in the function and rebuild.
  Don't edit `Docs/` by hand.
- `PSWriteHTML.psd1` is refreshed by the build. The build also merges approved
  helper functions from PSSharedGoods into the released module.
- `Artefacts/` and `WebsiteArtifacts/` are build output and ignored.

## Conventions

- Keep Windows PowerShell 5.1 compatibility. No PowerShell 7-only syntax.
- K&R/OTBS braces, 4-space indentation, full parameter names. Comment-based
  help sits inside the function, before `[CmdletBinding()]`.
- A feature in `Get-DefaultParameters` has both a local file under `Resources/`
  (embedded by default) and a CDN link (used with `New-HTML -Online`). When you
  update a library, update both and keep the versions matching.
- PSParseHTML and Mailozaurr are optional. Check for them at runtime, don't add
  them as required modules.
- Commit and PR titles use Conventional Commits with Gitmoji:
  `fix(tabs): 🐛 honor first-tab hash navigation`.

## Gotchas

- `Tests/Browser/*.ps1` are not part of the Pester run. They need a loopback
  HTTP server serving the generated reports and PSParseHTML's headless Edge:
  `./Tests/Browser/Invoke-TopNavigationTest.ps1 -ReportDirectory <dir> -BaseUri http://127.0.0.1:<port>/`.
- `Email` can send real mail (SMTP or the optional Mailozaurr). Tests mock
  sending. Don't send mail unless the task asks for it.

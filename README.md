# Making CockroachDB run in secure mode as a service on MacOS

The brew services form of CockroachDB unfortunately runs in insecure mode.

## Manual start

Use [start-cockroach](./start-cockroach.sh)

## Make an Automator Service

See [Make a System-Wide Service in Apple Developer Docs](https://developer.apple.com/library/archive/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/MakeaSystem-WideService.html#//apple_ref/doc/uid/TP40016239-CH46-SW1) to get started

* Save [start-cockroach.sh](./start-cockroach.sh) someplace
* Create a Workflow
* Settings
  * No input
  * Run shell script (bash)
* Paste the contents of [the workflow script](wokflow-script.sh), changing paths as needed.
* Create the log file and allow writes.
* Test it
* Save it
* Export it somewhere

## Make a `launchctl` service

* Edit and save the [plist](./standsure.cockroach.plist) to `~Library/LaunchAgents`
* Load it with `launchctl load ~/Library/LaunchAgents/standsure.cockroach.plist`

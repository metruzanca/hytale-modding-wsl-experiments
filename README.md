# Hytale Plugin Template

A ready-to-use starting point for creating Hytale server plugins with Java, _or Kotlin_. If you've
been using the Asset Editor and want to start writing server-side logic — custom commands, event
handling, gameplay systems — this is the simplest place to begin.

## How to start?

1. Copy the template by downloading it or using the "Use this template" button.
2. [Configure or Install the Java SDK](https://hytalemodding.dev/en/docs/guides/plugin/setting-up-env)
   to use the latest 25 from JetBrains or similar.
3. **Set up Hytale path** (required for WSL/Windows users):
   - Install [direnv](https://direnv.net/): `curl -sfL https://direnv.net/install.sh | bash`
   - Run `direnv allow` in the project directory (this loads `.envrc`)
   - Run the setup script: `./setup-wsl.sh`
4. Open the project in your favorite IDE, we
   recommend [IntelliJ IDEA](https://www.jetbrains.com/idea/download).
5. Run the devserver: `gradle devServer`

> This project uses Gradle via mise. Ensure you have `gradle` available in your PATH.

With that you will be prompted in the output to authorize your server, and then you can start
developing your plugin while the server is live reloading the code changes.

From here,
the [HytaleModding guides](https://hytalemodding.dev/en/docs/guides/plugin/build-and-test) cover
more details!

## Scaffoldit Plugin

While there are multiple plugins made for Hytale, the template currently uses a zero-boilerplate one
where you only need the absolute minimum to start. However, you do have access to everything as
normal if you know what you are doing.

For in-depth configuration, you can visit the [ScaffoldIt Plugin Docs](https://scaffoldit.dev).

## WSL (Windows Subsystem for Linux) Setup

Running the dev server in WSL while Hytale is installed on Windows is fully supported:

1. Ensure Hytale is installed on Windows via the Hytale Launcher
2. The `.envrc` file is pre-configured with the WSL path (`/mnt/c/Users/samue/AppData/Roaming/Hytale`)
3. Install direnv: `curl -sfL https://direnv.net/install.sh | bash`
4. Run `direnv allow` to load the environment
5. Run `./setup-wsl.sh` to configure Gradle (one-time setup)
6. Start the server: `gradle devServer`

The setup script writes the Hytale path to your global Gradle configuration (`~/.gradle/gradle.properties`), which is the standard location for machine-specific settings.

## Troubleshooting

- **Gradle sync fails in IntelliJ** –
  _Check that Java 25 is installed and configured under File → Project Structure → SDKs._
- **Build fails with missing dependencies** –
  _Run `./gradlew build --refresh-dependencies`. Make sure you have internet access!_
- **Permission denied on `./gradlew`** –
  _Run `chmod +x gradlew` (macOS/Linux)._
- **Hot-reload doesn't work** –
  _Verify you're using JetBrains Runtime, not a regular JDK._
- **"Assets are not present" error** –
  _Make sure `HYTALE_HOME` is set correctly and Hytale is installed on Windows. Run `direnv allow` and then `./setup-wsl.sh` to configure Gradle._

## Resources

- [Hytale Modding Guides](https://hytalemodding.dev)
- [Hytale Modding Discord](https://discord.gg/hytalemodding)
- [ScaffoldIt Plugin Docs](https://scaffoldit.dev)

## License

Add your own after copying the template, though we recommend using MIT, BSD, or Apache to keep
the modding community open!

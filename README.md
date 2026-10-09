# Throw the Dice

An OpenHarmony example for choosing a tabletop die or coin and generating one result on a default or tablet device.

## What this example demonstrates

| Capability | API or platform service | Where to look |
| --- | --- | --- |
| Show die and coin choices in a grid and open the roll screen | ArkUI `Grid`, `ForEach`, and `UIContext.getRouter()` | [Index.ets](entry/src/main/ets/pages/Index.ets), [DiceItem.ets](entry/src/main/ets/view/DiceItem.ets) |
| Pass the selected die between pages | ArkUI `@StorageLink` and `@StorageProp` | [Index.ets](entry/src/main/ets/pages/Index.ets), [RollPage.ets](entry/src/main/ets/pages/RollPage.ets) |
| Generate a value for the selected die or coin | `Math.random()` | [Random.ets](entry/src/main/ets/common/Random.ets), [RollPage.ets](entry/src/main/ets/pages/RollPage.ets) |

## Preview

![D6 result screen with the Roll again button](assets/preview.jpg)

## Requirements

- Oniro SDK 6.1 (API 23), OpenHarmony command-line tools, `oniro-app` 0.10.0, Node.js, and Java. The [build workflow](.github/workflows/build.yml) uses Node.js 22 and Java 17.
- An OpenHarmony device or emulator with API 20 or later to run the app. The module declares `default` and `tablet` device types in [module.json5](entry/src/main/module.json5).
- Local development signing. The app declares no permissions and uses no external service.

## Build and run

From the repository root, install the tools if needed, create the local build profile, sign, and build:

```sh
npm install -g @oniroproject/oniro-app@0.10.0
oniro-app sdk install 6.1
oniro-app cmdtools install
cp build-profile.example.json5 build-profile.json5
oniro-app sign
oniro-app build
```

The signing command creates development signing material. `build-profile.json5` and `signatures/` are ignored by Git. With a device or emulator connected, install and launch the built HAP:

```sh
oniro-app app install
oniro-app app launch
```

## Use

Choose Coin, D4, D6, D8, D10, D12, D20, or D100. The result appears on the next screen. Tap **Roll again** for another result, or **Back** to choose a different option.

## Explore the implementation

[EntryAbility.ets](entry/src/main/ets/entryability/EntryAbility.ets) loads the selection page. [DiceData.ets](entry/src/main/ets/model/DiceData.ets) lists the available choices. The selection page stores the chosen number of sides, and the roll page reads it and calls [Random.ets](entry/src/main/ets/common/Random.ets).

To regenerate the launcher and startup icons, run `assets/render_icon.py` with Python and Pillow. To regenerate the coin illustration, run `assets/render_coin.py`; it also requires Segoe UI Bold or DejaVu Sans Bold. These scripts write PNGs into the app resource directories.

## Verify

On a connected OpenHarmony device or emulator:

1. Open the app and check that all eight choices appear.
2. Select a die and check that its result is between 1 and its number of sides. Tap **Roll again** and check another result.
3. Return to the choices, select Coin, and check that the result is Heads or Tails.

## Contributing

These apps are focused examples of specific platform capabilities. Contributions that keep an example correct, buildable, and clear are welcome, including bug fixes, documentation and setup corrections, and improvements to its existing behavior. Please keep pull requests within the app's stated purpose and describe how you verified the change.

**Found a problem but can't fix it?** Open an issue in this repository; a pull request is not required. For a bug or broken build, include the steps to reproduce it, what you expected, what happened, and your device, OS, and SDK/API version. Logs or screenshots are helpful when available. You can also open an issue for inaccurate or unclear documentation.

## License

This project is licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE).

# Config reference

* [NavigationBarConfig](#navigationbarconfig)

## NavigationBarConfig

The config for an instance of a navigation bar.

![navigationbar_1.png](./assets/navigationbar_1.png)
![navigationbar_2.png](./assets/navigationbar_2.png)

| Badge | Name | Type | Default value | Description |
| ----- | ---- | ---- | ------------- | ----------- |
| 1 | colors.background | UIColor | light: #F9F9F9 35% / dark: #1F1F1F 35% | The background color of the navigation bar. |
| 1 | userInterface.backgroundStyle | BarBackgroundStyle | translucent | The background style of the navigation bar. |
| 2 | colors.buttonsTint | UIColor | light: #15202B / dark: #FFFFFF | The color applied to buttons. |
| 3 | colors.titleText | UIColor | light: #15202B / dark: #FFFFFF | The text color of the title. |
| 3 | fonts.title | FontInfo | System bold 26 | The font of the title. |
| 4 | colors.subtitleText | UIColor | light: #15202B / dark: #FFFFFF | The text color of the subtitle. |
| 4 | fonts.subtitle | FontInfo | System 12 | The font of the subtitle. |
| 5 | colors.progressbarBackground | UIColor | light: #F9F9F9 / dark: #000000 | The background (non filled) color of the progress bar. |
| 6 | colors.progressbarFill | UIColor | light: #86949B / dark: #B4B4B4 | The filled color of the progress bar. |
| 7 | colors.logoBackground | UIColor? | #FFFFFF | The background color of the logo. |
| 7 | colors.logoBorder | UIColor? | #ECECEC | The border color of the logo. |
| 7 | images.logo | UIImage? | nil | The brand logo to display in the reader, if no one is provided by the datasource. |

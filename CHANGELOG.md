# MiLibrisReaderSDK iOS changelog

### v1.11.1
06/02/2025

**Improvements**

- [TC-7277] Delay C4 timer if page is not loaded

### v1.11.0
31/10/2024

**Features**

- Allow override of the API v4 base URL via app's Info.plist

### v1.10.0
16/09/2024

**Features**

- [TC-6922] Update tutorial to optionally include long press
- [TC-5458] Improve landscape mode on phones (the reader will now support landscape even if the presenting screen does not)

**Improvements**

- [TC-7103] Fix math error in articles interactive dismissal

### v1.9.0
27/06/2024

**Features**

- [TC-6833] See back cover ad when opening an edition

### v1.8.0
03/05/2024

**Features**

- [TC-6217] Improve multimedia boxes visibility
- [TC-6768] Add new delayed event for page read

### v1.7.0
17/04/2024

**Features**

- [TC-6857] Add privacy manifest

**Improvements**

- [TC-6826] Prevent user interaction during automatic page turn (PDF & articles); add optional config to also prevent interaction during manual page turn

### v1.6.0
26/02/2024

**Features**

- [TC-3862] Replace article loading UI with skeleton+shimmer effect
- [TC-6533] Add utility method to override article fonts

**Improvements**

- [TC-6709] Hide article capsule view when a PDF page is zoomed in

### v1.5.0
14/02/2024

**Features**

- [TC-3084] Allow injection of article audio feature
- [TC-6526] Add config `articleReader.features.forceLayout` to force article reader layout for all articles
- [TC-6526] Add config `articleReader.features.isImageCropEnabled` to disable image cropping in article content

**Improvements**

- [TC-6623] Change subtitle fallback when day of month is nil in miLibris datasource
- [CIOS-1124] Fix layout of publication name when too long

### v1.4.0
28/11/2023

**Features**

- [TC-6295] Filter advertisements in reader capsule, mini-summary and summary
- [TC-6295] Add advertisement templates

**Improvements**

- [TC-6371] Fix spelling

### v1.3.0
28/09/2023

**Features**

- [TC-5967] Support audio background mode for text-to-speech
- [TC-6379] Add config to disable the summary in the reader and article reader
- Add an optional article search feature in the summary

### v1.2.0
16/08/2023

**Features**

- [TC-6281] Add new utility method to hide the logo capsule
- [TC-6285] Update font for `<em>` tags

### v1.1.0
27/06/2023

**Features**

- [TC-5651] Add article source link in articles
- [TC-6036] Implement dropcaps in miLibris datasource
- [TC-6040] Add print action

### v1.0.2
02/06/2023

**Improvements**

- [TC-6069] Fix top bar buttons layout on small screens / long titles

### v1.0.1
21/04/2023

**Improvements**

- [TC-6059] Fix intertitle layout on iPad

### v1.0.0
19/04/2023

**New article reader**

- Uses native components instead of web components to improve performance and allow better customization
- The previous reader is still available for legacy articles

### v0.5.0
21/03/2023

**Breaking**

- [TC-5940] Make the miLibris datasource internal

### v0.4.0
08/11/2022

**Features**

- [TC-5476] Add reader tutorial

### v0.3.1
20/09/2022

**Improvements**

- [TC-5282] Do not override box highlight color with customer branding, update default highlight color

### v0.3.0
08/09/2022

**Features**

- [TC-4494] Add HTML enrichments
- [TC-3570] Add delegate method to track HTML enrichments usage
- [TC-4705] Add accessibility identifiers
- [TC-4484] Add internal video enrichments
- [TC-3566] Add delegate method to track video enrichments usage
- [TC-4480] Add internal audio enrichments
- [TC-4497] Add slideshow enrichments
- [TC-4486] Add external video enrichments
- [TC-4616] Add licence key check
- [TC-4617] Prepare SDK for distribution

### v0.2.2
13/07/2022

**Improvements**

- [TC-4824] Fix subtitle partially hidden when title is too long in summary articles
- [TC-4870] Fix crash "No view controller managing visible view" in PageViewController
- [TC-4871] Prevent crash in transition when image or transition size is 0

### v0.2.1
30/05/2022

**Improvements**

- [TC-4755] Fix paging performance
- [TC-4753] Fix regression: datasource methods must always be called on the main thread

### v0.2.0
09/05/2022

**Features**

- [TC-4371] Add thumbnails in miLibris summary
- [TC-4530] Add on-device Smart Crop
- [TC-4471] Add internal links enrichment
- [TC-4477] Add external links enrichment

**Improvements**

- [TC-4404] Fix PDF images not displayed with some publications

### v0.1.0
01/04/2022

- First release

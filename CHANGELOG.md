# MiLibrisReaderSDK iOS changelog

### v1.2.0
16/08/2023

**Features**

- [TC-6281] Add new utility method to hide the logo capsule
- [TC-6285] Update font for *<em>* tags

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

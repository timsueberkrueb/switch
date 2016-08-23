# Switch

 A simple game about solving matrices

## Credits
* Thanks to [Stuart Langridge](https://twitter.com/sil) for testing, design input and QA.
* Thanks to [Sam Hewitt](http://samuelhewitt.com/) for creating the [Ubuntu Icon Resource Kit](https://github.com/snwh/ubuntu-icon-resource-kit) which was used to create the application icon

## Installation

### Ubuntu Desktop
Make sure you have all dependencies installed:
```
sudo apt update
sudo apt install qt5-default
sudo apt install qtdeclarative5-dev qtbase5-dev
sudo apt install libqt5svg5-dev
```
Clone, build and run:
```
git clone https://github.com/tim-sueberkrueb/switch
cd switch
qmake; make
./switch.timsueberkrueb
```
Tested on Ubuntu 16.04.

### Ubuntu phone
Make sure you have the [Ubuntu SDK installed](https://developer.ubuntu.com/en/phone/platform/sdk/installing-the-sdk/).
Open the project (File > Open file or project > Select `switch.timsueberkrueb.pro`)

Select and/or create all necessary build kits in the `Projects` tab.

Attach a device and click the run button.

## License and Copyright

Copyright © 2016 Tim Süberkrüb

This application is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

See LICENSE for more information.


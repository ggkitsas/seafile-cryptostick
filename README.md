Seafile integrated with smart card functionallity
=================================================

This feature allows users to encrypt their libraries with a [Crypto Stick](http://crypto-stick.com/) or [OpenPGP Card](http://g10code.com/p-card.html) device. In this case the AES library key is encrypted for the private RSA key stored securely on the device. Thus the user enjoys higher security while being able to access his encrypted library on any random computer where Seafile is installed. This feature is an alternative to the usage of an ordinary password and doesn't affect it in any way. Both options coexist smoothly.

For the communication with the smart card, no extra drivers are needed.

### Functionallity

#### Securing a library using Crypto Stick and OpenPGP Card
* When creating a library enable "Encrypt with Crypto Stick" option.
* Then choose a connected device from the dropdown menu

  ![Creating a new smart-card secured lib](https://github.com/ggkitsas/seafile-cryptostick/blob/master/screenshots/create-lib-smart-card.png)
* Enter device user PIN

  ![User PIN for creating](https://github.com/ggkitsas/seafile-cryptostick/blob/master/screenshots/create-lib-smart-card-user-pin.png)


#### Syncing a library protected using a Crypto Stick and OpenPGP Card
* At the 'sync library' dialog, enable 'Use registered Crypto Stick for this library'
* Choose your device from the dropdown menu

  ![Syncing using a smart card device](https://github.com/ggkitsas/seafile-cryptostick/blob/master/screenshots/sync-lib-smart-card.png)
* Enter device user PIN

  ![User PIN when syncing](https://github.com/ggkitsas/seafile-cryptostick/blob/master/screenshots/sync-lib-smart-card-user-pin.png)

#### Using blank Crypto Stick and OpenPGP Card
When using a blank device, you either have to generate new keys, or import keys from a backup file. The dialog responsible for these actions will pop-up automatically when you choose to use a blank device during creation or syncing of a library:

![Generate/Import keys](https://github.com/ggkitsas/seafile-cryptostick/blob/master/screenshots/generate-import-key.png)

To generate keys:
* Choose key size
* Optionally choose a file to backup your keys
* Press OK

To import keys from a file:
* Just choose the key file and press OK

You will then promted to insert the Admin PIN of the device:

![Admin PIN](https://github.com/ggkitsas/seafile-cryptostick/blob/master/screenshots/gen-import-admin-pin.png)

#### Creating a backup device
A backup device is a different device (different serial number) which contains the same key material with your primary device.
If you want to create a backup device using Seafile you must already have a key backup file of your primary device, and a second blank device. Then all you have to do is to use the blank device with Seafile and import the keys saved at the backup file. 


#### Unblocking a smart card device
When a blocked device is used, it is autodetected and a prompt to unblock it pops up:

![Blocked device detected](https://github.com/ggkitsas/seafile-cryptostick/blob/master/screenshots/device-blocked.png)

Then the Admin PIN password is requested:

![Admin PIN](https://github.com/ggkitsas/seafile-cryptostick/blob/master/screenshots/admin-pin.png)

And finally the user has to set up her new device user PIN:

![New PIN](https://github.com/ggkitsas/seafile-cryptostick/blob/master/screenshots/new-user-pin.png)


### Near-future TODO's
* Create a dialog to manage smart card devices
  * Change user PIN
  * Change admin PIN
  * Import keys
  * Generate and/or backup keys


### Future feature list
For full and up-to-date feature list see this repo's issues marked as enchancements.

* Using a device along with a password to protect a library
* Registering more than one devices to an encrypted library
* Registering a device using a backup file (usefull when sharing libraries)
* Auto backup and sync storage contents of Crypto Stick Storage version

### File/Folder structure of this repository
* ccnet:
A framework for writing networked applications in C. Needed to build Seafile client
* libsearpc:
A simple and easy-to-use C language RPC framework (including both server side & client side) based on GObject System. Needed to build Seafile client
* seafile:
Core code for Seafile
* seafile-client:
Seafile client implementation
* build:
Prefixed build of Seafile
* patches:
Minor patches needed during build process
* run.sh:
small script to run seafile(terminal) or seafile applet

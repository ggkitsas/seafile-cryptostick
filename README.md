seafile-cryptostick
===================
This feature allows users to encrypt their libraries with a [Crypto Stick](http://crypto-stick.com/) or [OpenPGP Card](http://g10code.com/p-card.html) device. In this case the AES library key is encrypted for the private RSA key stored securely on the device. Thus the user enjoys higher security while being able to access his encrypted library on any random computer where Seafile is installed. This feature is an option to the encryption with ordinary password and doesn't affect it in any way. Both options coexist smoothly.

### User Cases

#### Securing a library using Crypto Stick and OpenPGP Card
1. When creating a library enable "Encrypt with Crypto Stick" option.
2. Then choose a connected device from the dropdown menu
![Creating a new smart-card secured lib](https://github.com/ggkitsas/seafile-cryptostick/blob/master/screenshots/create-lib-smart-card.png)
3. Enter device user PIN:
![User PIN for creating](https://github.com/ggkitsas/seafile-cryptostick/blob/master/screenshots/create-lib-smart-card-user-pin.png)


#### Syncing a library protected using a Crypto Stick and OpenPGP Card
1. At the 'sync library' dialog, enable 'Use registered Crypto Stick for this library'
2. Choose your device from the dropdown menu:
![Syncing using a smart card device](https://github.com/ggkitsas/seafile-cryptostick/blob/master/screenshots/sync-lib-smart-card.png)

3. Enter device user PIN

![User PIN when syncing](https://github.com/ggkitsas/seafile-cryptostick/blob/master/screenshots/sync-lib-smart-card-user-pin.png)

#### Using blank Crypto Stick and OpenPGP Card
When you want to use a blank device you have two options:

1. Generate or Import an encryption key pair during the creation of a new library.
   During the creation of a new library, if the selected device is blank, it is auto-detected.
   A dialog will pop-up asking you to generate or import a key pair to the device.
2. Generate or Import an encryption key pair from Settings.


#### Creating a backup device
You can create a backup device from Settings. Alternatively you can create a backup, using a blank
device when creating a new library and importing the key pair from your .keys file.


### Implementation


### Future feature list
For full and up-to-date feature list see this repo's issues marked as enchancements.

* Using a device along with a password to protect a library
* Registering more than one devices to an encrypted library
* Registering a device using a backup file (usefull when sharing libraries)

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

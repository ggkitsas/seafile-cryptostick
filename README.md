seafile-cryptostick
===================
Seafile with Crypto Stick support

### User Cases

#### Securing a library using Crypto Stick (or OpenPGPv2 card)
1. When creating a library enable "Encrypt with Crypto Stick" option.
2. Then choose a connected Crypto Stick from the dropdown menu
3. Enter Crypto Stick user PIN

#### Syncing a library protected using a Crypto Stick
1. At the 'sync library' dialog, enable 'Use registered Crypto Stick for this library'
2. Choose your device from the dropdown menu

![Syncing using a Crypto Stick](https://github.com/ggkitsas/seafile-cryptostick/blob/master/screenshots/sync-lib.png)

#### Using blank Crypto Stick
When you want to use a blank Crypto Stick you have two options:

1. Generate or Import an encryption key pair during the creation of a new library.
   During the creation of a new library, if the selected Crypto Stick is blank, it is auto-detected.
   A dialog will pop-up asking you to generate or import a key pair to the device.
2. Generate or Import an encryption key pair from Settings.


#### Creating a backup device
You can create a backup device from Settings. Alternatively you can create a backup, using a blank
Crypto Stick when creating a new library and importing the key pair from your .keys file.


### Implementation


### Future feature list
For full and up-to-date feature list see this repo's issues marked as enchancements.

* Using Crypto Stick along with a password to protect a library
* Registering more than one Crypto Sticks to an encrypted library
* Registering a Crypto Stick using a backup file (usefull when sharing libraries)

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

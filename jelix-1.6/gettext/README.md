
It is not recommended to modify by hand, `po` and `pot` files!

We prefer to translate strings with Transifex, and then import translations
into the gettext and locales directories.

POT files must be generated directly from properties files of the original project.

Be sure you have installed Transifex cli, but also PHP-cli and its mbstring extension
(For example `apt-get install php7.3-cli php7.3-mbstring`).

You also need to retrieve the source code of Jelix

- https://github.com/jelix/jelix.git


Updating the list of strings to translate (pot files)
-----------------------------------------------------

First, you must generate the `.pot` files, from the `.properties` files.

Then you have to execute this command, by giving the
path to the `.jelixlocales.ini` file you found into source code of projects:

```
./update_from_jelix.sh /path/to/jelix/.jelixlocales.ini
```

Then you push them to Transifex

```
./push_to_transifex.sh
```


Updating translated strings
---------------------------

When some new translations are available in Transifex, you can import them
into the locales directory.

First retrieve translated string from Transifex, it updates po files:

```
./update_from_transifex.sh
```

Then execute this script:

```
./convert_to_properties.sh /path/to/jelix/.jelixlocales.ini 
```

It updates `.properties` files  into the `locales/` directory from `po` files.


Adding a new language
---------------------

A contributor have translated locales into a new language on Transifex.
To retrieve them:

- Add the locale into the `lang_map` into .tx/config
- launch `./update_from_transifex.sh -f <langcode>` (ex: `./update_from_transifex.sh -f ja`)
- launch `./convert_to_properties.sh /path/to/jelix/.jelixlocales.ini`
- commit the new directory into gettext and locales directories.

jelix-langpacks
===============

Translation of properties files for jelix modules, for Jelix 1.6.

Translations are edited with Transiflex. See https://www.transifex.com/3liz-1/jelix/dashboard/

This repository contains translation of several project/branches:
- `jelix-1.6`: translation of modules provided with Jelix 1.6.
  Translations for modules: jelix, jacl2, jacl2db, jacl2db_admin, jauthdb_admin, master_admin
- `modules`: translation for some modules. Translations for modules: jCommunity.


All projects have two directories:

- `gettext`: po and pot files to pull/push from/to transifex 
- `locales`: translated strings into properties files, the format used by Jelix.
  The `locales` directory follow the hierarchy `<xx_YY>/<module name>/locales/<properties files>`, 
  so it is easy to install them by copying the content of `locales` to the 
  `app/locales/` directory or the `var/locales/` directory of your Jelix application. 
  
There are many languages, but there are not supported at 100%. Feel free
to help us to complete translations by contributing directly on
https://www.transifex.com/3liz-1/jelix/dashboard/.

Don't propose Pull Request to translate strings. We are exclusively using Transifex.


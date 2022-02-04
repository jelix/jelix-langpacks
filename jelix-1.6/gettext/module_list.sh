#!/usr/bin/env bash

export MODULES="jelix master_admin jacl2 jacl2db jacl2db_admin jauthdb_admin"

# all locales that are available into transifex.
export AVAILABLE_LOCALES="cs_CZ de_DE el_GR es_ES eu_ES fi_FI fr_FR gl_ES hu_HU it_IT ja_JP nl_NL no_NO pl_PL pt_BR pt_PT ro_RO ru_RU sv_SE sl_SI sk_SK uk_UA"
export AVAILABLE_SHORT_LOCALES="cs de el es eu fi fr gl hu_HU it ja nl no pl_PL pt_BR pt ro ru sv_SE sl sk uk_UA"

# locales that are almost complete and so, that should be pushed to the project.
# in Jelix, we want the long language code (ex: ja_JP). If the translator registered
# only into the short code, indicate the code as : short code/long code (ex: ja/ja_JP)
export OFFICIAL_LOCALES="cs_CZ de_DE el_GR es_ES eu_ES fi_FI fr_FR gl_ES hu_HU it_IT ja_JP nl_NL no_NO pl_PL pt_BR pt_PT ro_RO ru_RU sv_SE sl_SI sk_SK uk_UA"

export LOCALES_BRANCH=jelix-1.6


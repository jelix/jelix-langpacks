#!/usr/bin/env bash

export MODULES="jelix master_admin jacl2 jacl2db jacl2db_admin jauthdb_admin"

# all locales that are available into transifex.
export AVAILABLE_LOCALES="cs_CZ de_DE el_GR es_ES eu_ES fi_FI fr_FR gl_ES hu_HU it_IT ja_JP nl_NL no_NO pl_PL pt_BR pt_PT ro_RO ru_RU sv_SE sl_SI sk_SK"

# locales that are almost complete and so, that should be pushed to the project.
# in Jelix, we want the long language code (ex: ja_JP). If the translator registered
# only into the short code, indicate the code as : short code/long code (ex: ja/ja_JP)
export OFFICIAL_LOCALES="cs_CZ de_DE el_GR es_ES eu_ES fi_FI fr_FR gl_ES hu_HU it_IT ja_JP nl_NL no_NO pl_PL pt_BR pt_PT ro_RO ru_RU sv_SE sl_SI sk_SK"

export LOCALES_BRANCH=jelix-1.7


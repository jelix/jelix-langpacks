#!/usr/bin/env bash

export MODULES="jcommunity"

# all locales that are available into transifex.
export AVAILABLE_LOCALES="cs_CZ de_DE el_GR es_ES eu_ES fi_FI fr_FR gl_ES hu_HU it_IT nl_NL no_NO pl_PL pt_BR pt_PT ro_RO ru_RU sv_SE sl_SL sk_SK"

# locales that are almost complete and so, that should be pushed to the project.
export OFFICAL_LOCALES="cs_CZ de_DE el_GR es_ES eu_ES fi_FI fr_FR gl_ES hu_HU it_IT nl_NL no_NO pl_PL pt_BR pt_PT ro_RO ru_RU sv_SE sl_SL sk_SK"

export LOCALES_BRANCH=modules

# FIXME ldapdao is not activated by default into LWC so the lizmap script cannot retrieve its locales.
export MISSING_MODULES="ldapdao"

jelix-langpacks
===============

Translation of properties files for jelix modules, for Jelix 1.6.

Follow this directories hierarchy:

   - `<xx_YY>`
      - `<module name>`
        - locales
           - properties files

The goal is to package the content of top directories, and to extract it directly 
into an "var/locales/" directory of an application.

There are locales for modules : 
- jelix
- jacl2db_admin, jauthdb_admin, master_admin
- jauth  

Missing modules: jpref_admin, jacl, jacl2, jacl2db, jacldb, jpref, jsoap, jtcpdf
          

.PHONY: build deploy


build:
	./build_jelix_1_6_packages.sh
	./build_module_packages.sh jcommunity
	./build_module_packages.sh ldapdao
	./build_module_packages.sh multiauth

deploy:
	jelix_upload_dir.sh _dist/jelix-1.6/ "$(CI_DEPLOY_USER)@$(CI_DEPLOY_SERVER)" langpacks/jelix-1.6
	jelix_upload_dir.sh _dist/jcommunity/ "$(CI_DEPLOY_USER)@$(CI_DEPLOY_SERVER)" langpacks/jcommunity
	jelix_upload_dir.sh _dist/ldapdao/ "$(CI_DEPLOY_USER)@$(CI_DEPLOY_SERVER)" langpacks/ldapdao
	jelix_upload_dir.sh _dist/multiauth/ "$(CI_DEPLOY_USER)@$(CI_DEPLOY_SERVER)" langpacks/multiauth


.PHONY: build deploy


build:
	./build_jelix_packages.sh 1.6
	./build_jelix_packages.sh 1.7
	./build_jelix_packages.sh 1.8
	./build_module_packages.sh jcommunity
	./build_module_packages.sh ldapdao
	./build_module_packages.sh multiauth

deploy:
	jelix_upload_dir.sh _dist/jelix-1.6/ "$(CI_DEPLOY_USER)@$(CI_DEPLOY_SERVER)" langpacks/jelix-1.6
	jelix_upload_dir.sh _dist/jelix-1.7/ "$(CI_DEPLOY_USER)@$(CI_DEPLOY_SERVER)" langpacks/jelix-1.7
	jelix_upload_dir.sh _dist/jelix-1.8/ "$(CI_DEPLOY_USER)@$(CI_DEPLOY_SERVER)" langpacks/jelix-1.8
	jelix_upload_dir.sh _dist/jcommunity/ "$(CI_DEPLOY_USER)@$(CI_DEPLOY_SERVER)" langpacks/jcommunity
	jelix_upload_dir.sh _dist/ldapdao/ "$(CI_DEPLOY_USER)@$(CI_DEPLOY_SERVER)" langpacks/ldapdao
	jelix_upload_dir.sh _dist/multiauth/ "$(CI_DEPLOY_USER)@$(CI_DEPLOY_SERVER)" langpacks/multiauth

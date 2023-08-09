#!/bin/bash
set -e
set -o pipefail

bash allScripts/starexecScripts/JavaSassAntInstall.sh

bash allScripts/starexecScripts/CloneStarexecRepo.sh

bash allScripts/starexecScripts/AddMachineSpecs.sh

bash allScripts/starexecScripts/ConfigTomcat7.sh

bash allScripts/starexecScripts/MariaDbconfig.sh

bash allScripts/starexecScripts/HttpdConfigAndRun.sh

bash allScripts/starexecScripts/SetupStarexecOverrideProps.sh

bash allScripts/starexecScripts/UpdateSudoRules.sh

bash allScripts/starexecScripts/AddRunsolverAndComputerInfo.sh


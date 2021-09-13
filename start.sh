#!/bin/bash
if grep -q "setup=true" "deepslateconfig/setup.yml" &> /dev/null; then
echo "Thank You For Using DeepslateMC, Please Wait While We Make Sure You Are Up To Date"
curl -o server.jar -z server.jar https://ci.pl3x.net/job/Purpur/lastSuccessfulBuild/artifact/final/purpurclip.jar &> /dev/null
cd plugins
curl -o Geyser-Spigot.jar -z Geyser-Spigot.jar https://ci.opencollab.dev//job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/spigot/target/Geyser-Spigot.jar &> /dev/null
curl -o floodgate-spigot.jar -z floodgate-spigot.jar https://ci.opencollab.dev/job/GeyserMC/job/Floodgate/job/master/lastSuccessfulBuild/artifact/spigot/target/floodgate-spigot.jar &> /dev/null
curl -o SkinsRestorer.jar -z SkinsRestorer.jar https://ci.codemc.io/job/SkinsRestorer/job/SkinsRestorerX-DEV/lastSuccessfulBuild/artifact/build/libs/SkinsRestorer.jar &> /dev/null
cd Geyser-Spigot
cd packs
curl -o GeyserOptionalPack.mcpack -z GeyserOptionalPack.mcpack https://ci.opencollab.dev/job/GeyserMC/job/GeyserOptionalPack/job/master/lastSuccessfulBuild/artifact/GeyserOptionalPack.mcpack &> /dev/null
cd ..
cd ..
cd ..
source deepslateconfig/ram.yml
echo "The Server Is Now Starting With "$ram" Gigabytes Of RAM, Happy Gaming!"
source deepslateconfig/ram.yml
java -Xms"$ram"G -Xmx"$ram"G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:InitiatingHeapOccupancyPercent=15 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -DGeyserSkinManager.ForceShowSkins=true -jar server.jar nogui1~
else
if grep -q "setup=false" "deepslateconfig/setup.yml" &> /dev/null; then
echo "Thank You For Using DeepslateMC, Please Wait While We Finish Setting Up Your Server"
sed -i 's/  server-mod-name: Purpur/  server-mod-name: DeepslateMC/g' purpur.yml &> /dev/null
curl -o server.jar -z server.jar https://ci.pl3x.net/job/Purpur/lastSuccessfulBuild/artifact/final/purpurclip.jar &> /dev/null
cd plugins
curl -o Geyser-Spigot.jar -z Geyser-Spigot.jar https://ci.opencollab.dev//job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/spigot/target/Geyser-Spigot.jar &> /dev/null
curl -o floodgate-spigot.jar -z floodgate-spigot.jar https://ci.opencollab.dev/job/GeyserMC/job/Floodgate/job/master/lastSuccessfulBuild/artifact/spigot/target/floodgate-spigot.jar &> /dev/null
curl -o SkinsRestorer.jar -z SkinsRestorer.jar https://ci.codemc.io/job/SkinsRestorer/job/SkinsRestorerX-DEV/lastSuccessfulBuild/artifact/build/libs/SkinsRestorer.jar &> /dev/null
cd Geyser-Spigot
sed -i 's/  server-name: "Geyser"/  server-name: "DeepslateMC"/g' config.yml &> /dev/null
sed -i 's/  auth-type: online/  auth-type: floodgate/g' config.yml &> /dev/null
sed -i 's/passthrough-motd: false/passthrough-motd: true/g' config.yml &> /dev/null
sed -i 's/passthrough-protocol-name: false/passthrough-protocol-name: true/g' config.yml &> /dev/null
sed -i 's/passthrough-player-counts: false/passthrough-player-counts: true/g' config.yml &> /dev/null
sed -i 's/legacy-ping-passthrough: false/legacy-ping-passthrough: true/g' config.yml &> /dev/null
sed -i 's/allow-third-party-ears: false/allow-third-party-ears: true/g' config.yml &> /dev/null
cd packs
curl -o GeyserOptionalPack.mcpack -z GeyserOptionalPack.mcpack https://ci.opencollab.dev/job/GeyserMC/job/GeyserOptionalPack/job/master/lastSuccessfulBuild/artifact/GeyserOptionalPack.mcpack &> /dev/null
cd ..
cd ..
cd ..
echo "The Server Is Now Setup, Happy Gaming!"
rm deepslateconfig/setup.yml
echo "setup=true" &> deepslateconfig/setup.yml
source deepslateconfig/ram.yml
echo Starting The Server With "$ram" Gigabytes of RAM
source deepslateconfig/ram.yml
java -Xms"$ram"G -Xmx"$ram"G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:InitiatingHeapOccupancyPercent=15 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -DGeyserSkinManager.ForceShowSkins=true -jar server.jar nogui1~
else
echo "Thank You For Using Deepslate MC, Please Wait While We Initialize Your Server!"
echo "Remember To Reboot Your Server After The Initialization So We Can Finish Setting It Up"
echo "eula=true" &> eula.txt
curl -o server.jar https://ci.pl3x.net/job/Purpur/lastSuccessfulBuild/artifact/final/purpurclip.jar &> /dev/null
mkdir plugins &> /dev/null
cd plugins
curl -o Geyser-Spigot.jar https://ci.opencollab.dev//job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/spigot/target/Geyser-Spigot.jar &> /dev/null
curl -o floodgate-spigot.jar https://ci.opencollab.dev/job/GeyserMC/job/Floodgate/job/master/lastSuccessfulBuild/artifact/spigot/target/floodgate-spigot.jar &> /dev/null
curl -o SkinsRestorer.jar https://ci.codemc.io/job/SkinsRestorer/job/SkinsRestorerX-DEV/lastSuccessfulBuild/artifact/build/libs/SkinsRestorer.jar &> /dev/null
mkdir Geyser-Spigot &> /dev/null
cd Geyser-Spigot
mkdir packs &> /dev/null
cd packs
curl -o GeyserOptionalPack.mcpack https://ci.opencollab.dev/job/GeyserMC/job/GeyserOptionalPack/job/master/lastSuccessfulBuild/artifact/GeyserOptionalPack.mcpack &> /dev/null
cd ..
cd ..
cd ..
mkdir deepslateconfig &> /dev/null
cd deepslateconfig &> /dev/null
echo "setup=false" &> setup.yml
echo "ram=2" &> ram.yml
cd ..
java -jar server.jar nogui
echo "Deepslate Initialization Complete, Remember To Reboot!"
fi
fi

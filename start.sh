#!/bin/bash
if grep -q "setup=true" "deepslateconfig/setup.yml" &> /dev/null; then
#echo "    ____                       __      __       __  _________"
#echo "   / __ \___  ___  ____  _____/ /___ _/ /____  /  |/  / ____/"
#echo "  / / / / _ \/ _ \/ __ \/ ___/ / __ \`/ __/ _ \/ /|_/ / /     "
#echo " / /_/ /  __/  __/ /_/ (__  ) / /_/ / /_/  __/ /  / / /___   "
#echo "/_____/\___/\___/ .___/____/_/\__,_/\__/\___/_/  /_/\____/   "
#echo "               /_/                                           "
echo "Thank You For Using DeepslateMC1.17, Please Wait While We Make Sure You Are Up To Date"
curl -o server.jar -z server.jar https://api.pl3x.net/v2/purpur/1.17.1/latest/download &> /dev/null
cd plugins
curl -o Geyser-Spigot.jar -z Geyser-Spigot.jar https://ci.opencollab.dev//job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/spigot/target/Geyser-Spigot.jar &> /dev/null
curl -o floodgate-spigot.jar -z floodgate-spigot.jar https://ci.opencollab.dev/job/GeyserMC/job/Floodgate/job/master/lastSuccessfulBuild/artifact/spigot/target/floodgate-spigot.jar &> /dev/null
if grep -q "UseSkinsRestorer=true" "deepslateconfig/updater.yml" &> /dev/null; then
curl -o SkinsRestorer.jar -z SkinsRestorer.jar https://ci.codemc.io/job/SkinsRestorer/job/SkinsRestorerX-DEV/lastSuccessfulBuild/artifact/build/libs/SkinsRestorer.jar &> /dev/null
else
rm SkinsRestorer.jar &> /dev/null
echo "skinsrestorer=false" &> SkinsRestorer.jar
fi
cd Geyser-Spigot/packs
curl -o GeyserOptionalPack.mcpack -z GeyserOptionalPack.mcpack https://ci.opencollab.dev/job/GeyserMC/job/GeyserOptionalPack/job/master/lastSuccessfulBuild/artifact/GeyserOptionalPack.mcpack &> /dev/null
cd ../../..
source deepslateconfig/startup.yml
echo "The Server Is Now Starting With" "$ram" "Gigabytes Of RAM, Happy Gaming!"
source deepslateconfig/startup.yml
java -Xms"$ram"G -Xmx"$ram"G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:InitiatingHeapOccupancyPercent=15 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true "$javaflags" -jar server.jar "$flags"
else
if grep -q "setup=false" "deepslateconfig/setup.yml" &> /dev/null; then
#echo "    ____                       __      __       __  _________"
#echo "   / __ \___  ___  ____  _____/ /___ _/ /____  /  |/  / ____/"
#echo "  / / / / _ \/ _ \/ __ \/ ___/ / __ \`/ __/ _ \/ /|_/ / /     "
#echo " / /_/ /  __/  __/ /_/ (__  ) / /_/ / /_/  __/ /  / / /___   "
#echo "/_____/\___/\___/ .___/____/_/\__,_/\__/\___/_/  /_/\____/   "
#echo "               /_/                                           "
echo "Thank You For Using DeepslateMC1.17, Please Wait While We Finish Setting Up Your Server"
sed -i 's/  server-mod-name: Purpur/  server-mod-name: DeepslateMC/g' purpur.yml &> /dev/null
curl -o server.jar -z server.jar https://api.pl3x.net/v2/purpur/1.17.1/latest/download &> /dev/null
cd plugins
curl -o Geyser-Spigot.jar -z Geyser-Spigot.jar https://ci.opencollab.dev//job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/spigot/target/Geyser-Spigot.jar &> /dev/null
curl -o floodgate-spigot.jar -z floodgate-spigot.jar https://ci.opencollab.dev/job/GeyserMC/job/Floodgate/job/master/lastSuccessfulBuild/artifact/spigot/target/floodgate-spigot.jar &> /dev/null
if grep -q "UseSkinsRestorer=true" "deepslateconfig/updater.yml" &> /dev/null; then
curl -o SkinsRestorer.jar -z SkinsRestorer.jar https://ci.codemc.io/job/SkinsRestorer/job/SkinsRestorerX-DEV/lastSuccessfulBuild/artifact/build/libs/SkinsRestorer.jar &> /dev/null
else
rm SkinsRestorer.jar &> /dev/null
echo "skinsrestorer=false" &> SkinsRestorer.jar
fi
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
cd ../../..
echo "The Server Is Now Setup, Happy Gaming!"
echo "You May Configure Certain Options From The Files In The Folder deepslateconfig"
rm deepslateconfig/setup.yml
echo "setup=true" &> deepslateconfig/setup.yml
source deepslateconfig/startup.yml
echo Starting The Server With "$ram" Gigabytes of RAM
source deepslateconfig/startup.yml
java -Xms"$ram"G -Xmx"$ram"G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:InitiatingHeapOccupancyPercent=15 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true "$javaflags" -jar server.jar "$flags"
else
#echo "    ____                       __      __       __  _________"
#echo "   / __ \___  ___  ____  _____/ /___ _/ /____  /  |/  / ____/"
#echo "  / / / / _ \/ _ \/ __ \/ ___/ / __ \`/ __/ _ \/ /|_/ / /     "
#echo " / /_/ /  __/  __/ /_/ (__  ) / /_/ / /_/  __/ /  / / /___   "
#echo "/_____/\___/\___/ .___/____/_/\__,_/\__/\___/_/  /_/\____/   "
#echo "               /_/                                           "
echo "Thank You For Using DeepslateMC1.17, Please Wait While We Initialize Your Server!"
echo "Remember To Reboot Your Server After The Initialization So We Can Finish Setting It Up"
echo "eula=true" &> eula.txt
rm server.jar &> /dev/null
curl -o server.jar https://api.pl3x.net/v2/purpur/1.17.1/latest/download &> /dev/null
mkdir plugins &> /dev/null
cd plugins
curl -o Geyser-Spigot.jar https://ci.opencollab.dev//job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/spigot/target/Geyser-Spigot.jar &> /dev/null
curl -o floodgate-spigot.jar https://ci.opencollab.dev/job/GeyserMC/job/Floodgate/job/master/lastSuccessfulBuild/artifact/spigot/target/floodgate-spigot.jar &> /dev/null
if grep -q "UseSkinsRestorer=true" "deepslateconfig/updater.yml" &> /dev/null; then
curl -o SkinsRestorer.jar https://ci.codemc.io/job/SkinsRestorer/job/SkinsRestorerX-DEV/lastSuccessfulBuild/artifact/build/libs/SkinsRestorer.jar &> /dev/null
else
rm SkinsRestorer.jar &> /dev/null
echo "useskinsrestorer=false" &> SkinsRestorer.jar
fi
mkdir Geyser-Spigot &> /dev/null
cd Geyser-Spigot
mkdir packs &> /dev/null
cd packs
curl -o GeyserOptionalPack.mcpack https://ci.opencollab.dev/job/GeyserMC/job/GeyserOptionalPack/job/master/lastSuccessfulBuild/artifact/GeyserOptionalPack.mcpack &> /dev/null
cd ../../..
mkdir deepslateconfig &> /dev/null
cd deepslateconfig &> /dev/null
rm setup.yml &> /dev/null
rm startup.yml &> /dev/null
echo "setup=false" &> setup.yml
echo "ram=2" &> startup.yml
echo "#Note- We do use Aikar's Reccomended Startup Flags for a Minecraft Server. The Following Startup javaflag is for a plugin" >> startup.yml
echo "#called GeyserSkinManager. This flag forces it to show Bedrock skins to Java players, even without having a mod installed." >> startup.yml
echo "#Do not attempt to use one of Aikar's Flags, or specify RAM from the Flags option." >> startup.yml
echo "#the javaflags config option is for the java machine" >> startup.yml
echo "#the flags option is for the serverjar, example:nogui/version" >> startup.yml
echo "javaflags=-DGeyserSkinManager.ForceShowSkins=true" >> startup.yml
echo "flags=nogui" >> startup.yml
echo "Credit for Main Jar goes to Purpur, and credit for Bedrock Support goes to GeyserMC" &> credits.yml
echo "UseSkinsRestorer=true" &> updater.yml
cd ..
java -jar server.jar nogui
echo "Deepslate Initialization Complete, Remember To Reboot!"
echo "You May Configure Certain Options From The Files In The Folder deepslateconfig"
fi
fi

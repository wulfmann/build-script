#!/bin/bash
#Make Scripts Globally Available
echo "Adding Scripts to PATH"
chmod u+x scripts/wlfmnn.sh;
cp scripts/wlfmnn.sh /usr/local/bin;
echo "Done"

#Copy Generator Files to Home Directory
echo "Copying generator files to home directory"
mkdir $HOME/wlfmnn;
cp -a . $HOME/wlfmnn;
echo "Done, files are available in" $HOME"/wlfmnn"

echo "You can run the script wlfmnn in the directory you would like to start a project in"
ROOT="$HOME/wlfmnn"
#New Project Prompt
while true; do
    read -p "Would you like to start a new project now? Y/N" yn
    case $yn in
        #If yes
        [Yy]* ) 
            DIRECTORY="$ROOT/wlfmnn-sites"
            if [ -d "$DIRECTORY" ]; then
                cd $ROOT/wlfmnn-sites;
            else
                mkdir $ROOT/wlfmnn-sites && cd $ROOT/wlfmnn-sites;
            fi
				#New Project name
				name="$(osascript -e 'Tell application "System Events" to display dialog "Enter the project name:" default answer ""' -e 'text returned of result' 2>/dev/null)"
				if [ $? -ne 0 ]; then
    				# The user pressed Cancel
    				exit 1 # exit with an error status
				elif [ -z "$name" ]; then
    					# The user left the project name blank
    				osascript -e 'Tell application "System Events" to display alert "You must enter a project name; cancelling..." as warning'
    				exit 1 # exit with an error status
				fi
                #Make new folder with User Inputed Name
				mkdir -p $name;
				cd $name;
                #Run Basic Script
				wlfmnn.sh;
				break;;
        #If No
        [Nn]* ) break;;
        * ) echo "";;
    esac
done 
exit
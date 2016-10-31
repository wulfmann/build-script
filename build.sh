#!/bin/bash
#Make Scripts Globally Available
echo "Making scripts globally available"
cp /scripts/. /usr/local/bin;
echo "Done"
#Copy Generator Files to Home Directory
echo "Copying generator files to home directory"
mkdir generator-files;
cp -a . $HOME/generator-files;
echo "Done, files are available in" $HOME"/generator-files"
echo "You can run the script wlfmnn in the directory you would like to start a project in"

#New Project Prompt
while true; do
    read -p "Would you like to start a new project? Y/N" yn
    case $yn in
        [Yy]* ) cd && mkdir wlfmnn-sites && cd wlfmnn-sites; 
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
				mkdir -p $name;
				cd $name;
				wlfmnn;
				break;;
        [Nn]* ) break;;
        * ) echo "";;
    esac
done 
exit
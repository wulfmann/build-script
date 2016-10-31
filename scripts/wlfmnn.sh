#!/bin/bash
#Generate File Tree
mkdir src;
mkdir dist;
mkdir -p src/js;
mkdir -p src/img;     
mkdir -p src/data;

#Git
while true; do
    read -p "Do you want to use Git? Y/N" yn
    case $yn in
        [Yy]* ) git init; 
				#Create Gitignore
				touch .gitignore;
				break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done 

#Package Managers
echo "Select a Package Manager"
managers=("NPM" "Bower" "Skip")
select opt in "${managers[@]}"
do
  case $opt in
    "NPM") 
		echo "You have selected NPM"; 
    	npm init;
    	#Add NPM dependencies to gitignore
    	echo "node_modules" >> .gitignore;
    	break
    	;;
    "Bower") 
		echo "You have selected NPM"; 
    	bower init;
    	#Add Bower dependencies to gitignore
    	echo "bower_components" >> .gitignore;
    	break
    	;;
    "Skip") 
		break
		;;
	*) echo invalid option;;
  esac
done

#Task Runner
while true; do
    read -p "Do you want to use a taskrunner? Y/N" yn
    case $yn in
        [Yy]* ) file="/package.json"
				if [ -f "$file" ]
				then
					echo "$file found."
				else
					npm init
				fi
				break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done 

#Styles
echo "Select a css preprocessor"
styleoptions=("SCSS" "Stylus" "Skip")
select opt in "${styleoptions[@]}"
do
  case $opt in
    "SCSS") 
		echo "You have selected SCSS"; 
		mkdir -p src/styles;
		cp -a preprocessors/scss/ src/styles
		echo "Styles Complete"
    	break
    	;;
    "Stylus")
		echo "You have selected Stylus"; 
		mkdir -p src/styles;
		cp -a preprocessors/stylus/ src/styles
		echo "Styles Complete"
    	break
    	;;
    "Skip") 
		break
		;;
	*) echo invalid option;;
  esac
done

#Templating
echo "Select an html templating engine"
engines=("Nunjucks" "Pug" "Liquid" "Handlebars" "Skip")
select opt in "${engines[@]}"
do
  case $opt in
    "Nunjucks") 
		cp -a /engines/nunjucks/ src/
		echo "HTML Complete"
    	break
    	;;
    "Pug")
		cp -a /engines/pug/ src/
		echo "HTML Complete"
    	break
    	;;
    "Liquid")
		cp -a /engines/liquid/ src/
		echo "HTML Complete"
    	break
    	;;
	"Handlebars")
		cp -a /engines/handlebars/ src/
		echo "HTML Complete"
    	break
    	;;
    "Skip") 
		break
		;;
	*) echo invalid option;;
  esac
done

#Open Project Directory in Sublime
subl .;
echo "Complete"
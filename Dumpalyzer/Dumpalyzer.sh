#!/bin/bash
#Variables
clear
TYPE=$1
FILENAME=$2
dirpath=$(pwd)
ProgType=("vol" "strings" "foremost" "binwalk" "bulk-ext")
target_filepath="$dirpath"/"$FILENAME"-"$(date +'%d%m%y')"

function START() 
{
  echo -e "\e[32;1mAnalyzer\e[0m \e[1;32m(AKA - Dumpalyzer v1.1.9)\e[0m"
  echo -e "\e[1;32mBakeneko, CrunchCorp LLC\e[0m"
  pwdir="mkdir -pv $FILENAME"-$(date +'%d%m%y')""
  echo
  #Checks if file is a memory file or an hdd file, and according to type of file calls the relevant menu function.
  if [ "$TYPE" == "MEM" ] || [ "$TYPE" == "mem" ]; then
    echo -e "\e[1;37m[\e[0m\e[1;36m*\e[0m\e[1;37m]\e[0m Analyzing memory file - \e[1;36m"$FILENAME"\e[0m"
    #Creates main directory for output of files extraction with filename and current date of the day.
    $pwdir > /dev/null 2>&1
    #Outputs the directory that been created for the user to see.
    echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m Directory created - \e[1;34m"$FILENAME"-"$(date +'%d%m%y')"\e[0m"
    echo 
    MEMORYFILEMENU
  elif [ "$TYPE" == "HDD" ] || [ "$TYPE" == "hdd" ]; then
    #Comments same as above.
    echo -e "\e[1;37m[\e[0m\e[1;36m*\e[0m\e[1;37m]\e[0m Analyzing HDD file - \e[1;36m"$FILENAME"\e[0m"
    $pwdir > /dev/null 2>&1
    echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m Directory created - \e[1;34m"$FILENAME"-"$(date +'%d%m%y')"\e[0m"
    echo
    HDDFILEMENU
  else
    #If user hasn't typed the correct usage, code will break and user will get the correct usage of syntax required to start use the script.
    echo -n "
    Correct usage: .\Dumpalyzer.sh [mem \ hdd] [FILE]
    "
    sleep 1
    exit 1
  fi
}

function GOODJOB()
{
  #This function purpose is to run a random series of encrypted sentences and decrypt one of them, when the user chooses not to use the help menu of each program.
  array[0]="T2YgY291cnNlIG5vdCwgeW91IGtub3cgd2hhdCB5b3UgYXJlIGRvaW5nLg=="
  array[1]="TmV2ZXIgdGVsbCBldmVyeXRoaW5nIHlvdSBrbm93Li4u"
  array[2]="VGhlcmUgYXJlIG5vIHR3byB3b3JkcyBpbiB0aGUgZW5nbGlzaCBsYW5ndWFnZSBtb3JlIGhhcm1mdWwgdGhhbiAtIEdvb2QgSm9iLg=="
  array[3]="U2VlLCB1bmxpa2UgbW9zdCBoYWNrZXJzLCBJIGdldCBhIGxpdHRsZSBqb3kgb3V0IG9mIGZpZ3VyaW5nIG91dCBob3cgdG8gaW5zdGFsbCB0aGUgbGF0ZXN0IHRveS4="
  array[4]="QmVoaW5kIGV2ZXJ5IHN1Y2Nlc3NmdWwgQ29kZXIgdGhlcmUgYW4gZXZlbiBtb3JlIHN1Y2Nlc3NmdWwgRGUtY29kZXIgdG8gdW5kZXJzdGFuZCB0aGF0IGNvZGUu"
  array[5]="VGhlcmUgYXJlIGZldyBzb3VyY2VzIG9mIGVuZXJneSBzbyBwb3dlcmZ1bCBhcyBhIHByb2NyYXN0aW5hdGluZyBjb2xsZWdlIHN0dWRlbnQu"
  array[6]="TmV2ZXIgdW5kZXJlc3RpbWF0ZSB0aGUgZGV0ZXJtaW5hdGlvbiBvZiBhIGtpZCB3aG8gaXMgdGltZS1yaWNlIGFuZCBjYXNoLXBvb3Iu"
  array[7]="RG9uJ3QgaGF0ZSBtZSwgaGF0ZSB0aGF0IGNvZGUu"
  array[8]="VGltZSBpcyB3aGF0IGRldGVybWluZXMgc2VjdXJpdHkuIFdpdGggZW5vdWdoIHRpbWUgbm90aGluZyBpcyB1bmhhY2thYmxlLg=="
  array[9]="RGFya25lc3MgZW52ZWxvcGVzIHRlY2hub2xvZ3kgd2hlcmUgb25seSBhIHNlbGVjdCBmZXcgZ2FpbiBhY2Nlc3MgdG8gdGhlIGxpZ2h0IHN3aXRjaC4="
  array[10]="VGhleSBzYXkgdGhhdCB0aGUgRGV2aWwgd29ya3MgaGFyZC4="
  array[11]="Tm90aGluZyB3aWxsIHdvcmsgdW5sZXNzIHlvdSBkby4="
  array[12]="U3R1cGlkaXR5IGNvbWJpbmVkIHdpdGggYXJyb2dhbmNlIGFuZCBhIGh1Z2UgZWdvIHdpbGwgZ2V0IHlvdSBhIGxvbmcgd2F5Lg=="

  size=${#array[@]}
  index=$(($RANDOM % $size))
  output=$(echo -n ${array[$index]} | base64 --decode)
  echo -e "\e[1;37m$output\e[0m"
  echo
}

function MEMORYFILEMENU()
{
  #A menu for the memory file. User need to choose an option to start a program. Else, script breaks.
  echo -e "\e[1;37mMEM\e[0m Analyzing Options:"
  echo -e "\e[1;37m[\e[0m\e[1;36m1\e[0m\e[1;37m]\e[0m Volatility"
  echo -e "\e[1;37m[\e[0m\e[1;36m2\e[0m\e[1;37m]\e[0m Strings"
  echo -e "\e[1;37m[\e[0m\e[1;36m3\e[0m\e[1;37m]\e[0m Bulk Extractor"
  echo "——————————————————"
  echo -e "\e[1;37m[\e[0m\e[1;36m0\e[0m\e[1;37m]\e[0m Exit Program"
  echo
  read -p $'\e[1;37mChoose\e[0m: ' MEM_MENUOPT
  clear
  case $MEM_MENUOPT in
  1)
    #VOLATILITY
    volpath="$(sudo find -name vol.py | head -n1)"
    #Script searchs for the existence of a volatility program installed and inserts the path into a variable. 
    #If no program exists, the script will install a standalone version, unzip it into the working directory, and give the main file required priviliges to run.
    if [ ! -f "$volpath" ]; then
      echo "Downloading Volatility 2.6 Stand-alone Version"
      wget http://downloads.volatilityfoundation.org/releases/2.6/volatility_2.6_lin64_standalone.zip &
      unzip volatility_2.6_lin64_standalone.zip &
      cd $dirpath/volatility_2.6_lin64_standalone
      cp volatility_2.6_lin64_standalone.py vol.py
      chmod 777 vol.py
    fi
    #Volatility will scan the file for its image info and output it for the user to choose a profile. 
    #That profile will be insterted into a variable which will be executed with the flag the user chooses.
    echo "Analyzing memory file for compatible profiles required to use volatility."
    $dirpath/volatility_2.6_lin64_standalone/vol.py -f $dirpath/$FILENAME imageinfo > /dev/null 2>&1 > imageinfo; cat imageinfo | grep Profile | sed 's/  */ /g'
    echo
    read -p "Choose a profile from the suggested list (Case-sensitive): " volProfile
    echo
    echo -e "You have selected profile - \e[1;37m$volProfile\e[0m."
    #Script asks the user if it need to read the help menu of the program. If not, it will continue with choosing a flag.
    read -s -p "Need to see the help menu for flags? (y/n):" helpmenu
    echo
    if [ "$helpmenu" == "y" ] || [ "$helpmenu" == "Y" ]; then
        $volpath -h | more
        echo
    fi
    if [ "$helpmenu" == "n" ] || [ "$helpmenu" == "N" ]; then
        echo
        #GOODJOB is the call for a function which brings up the encrypted sentences meant to motivate the user for the memory of not needing a help for choosing a flag.
        GOODJOB
    fi
    #Empty file is created to allow numbers to start from 1. Later will be deleted.
    touch "$target_filepath"/"${ProgType[0]}"-"$(date +'%d%m%y')"-0.txt
    times=0
    echo "Choose a flag for Volatility: "
    read FLAG
    #since Volatility cannot operate without a flag (no default option to choose from), a while loop will check and force user to choose a flag.
    #If user has forgotten the flags, it will allow him after three times to check the help menu again, then will prompt him, again, for a choice. 
    while [ -z "$FLAG" ] || [ "$FLAG" == "" ] || [ "$times" != 4 ]; do
        read -p "You must choose a flag. Choose again: " FLAG
        ((++times))
        if [ "$times" = 3 ]; then
            echo
            read -s -p "Need to see the help menu for flags? (y/n):" helpmenu
            if [ "$helpmenu" == "y" ] || [ "$helpmenu" == "Y" ]; then
                echo
                $volpath -h | more
                echo
                times=0
            fi
            if [ "$helpmenu" == "n" ] || [ "$helpmenu" == "N" ] || [ "$helpmenu" == "" ]; then
                echo
                times=0
            fi
        else
        read -p "You must choose a flag. Choose again: " FLAG
        fi
    done
    #After choosing a flag, program wil start extracting the file into a log file with the name of the program and the current date.
    echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m\e[1;37m Volatility:\e[0m Extracting\e[1;36m" $FILENAME"\e[0m."
    #Script will search if an already existing file with the name exist and if so, will save it as the next number of file, so user will not overwrite the log.
    $volpath --profile=$volProfile -f $FILENAME $FLAG > /dev/null 2>&1 > "$target_filepath"/"${ProgType[0]}"-"$(date +'%d%m%y')"-`ls "$target_filepath"/"${ProgType[0]}"-"$(date +''%d%m%y'')"* 2> /dev/null | wc -l`.txt
    echo
    #clear
    read -s -p "Would you like to view the extracted log file? (y/n) " readlstlog
    if [ "$readlstlog" == "y" ] || [ "$readlstlog" == "Y" ]; then
    #Last log will read the last saved file and output it for the user to read.
      lstlog=$(echo $(ls -t /$target_filepath/ | grep ./*.txt | head -1))
      #Checks if log file exists at all. If not, announcing file is empty and delete redundant log from output directory.
      if [ -z "$lstlog" ]; then
        echo -n "
        File is empty."
        rm -r $lstlog > /dev/null 2>&1
        echo
      else 
        less /$target_filepath/$lstlog
        echo
        #Saved file name is presented to user and is saved in the target directory.
        echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m Output created: \e[1;34m$lstlog\e[0m"
      fi    
    fi
    if [ "$readlstlog" == "n" ] || [ "$readlstlog" == "N" ]; then
      echo
      echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m Output created: \e[1;34m$lstlog\e[0m"
    fi
    rm "$target_filepath"/"${ProgType[0]}"-"$(date +'%d%m%y')"-0.txt
    echo
    cd ..
    ;;
  2)
    #STRINGS
    read -s -p "Need to see the help menu for flags? (y/n):" helpmenu
    if [ "$helpmenu" == "y" ] || [ "$helpmenu" == "Y" ]; then
        strings -h
        echo
    fi
    if [ "$helpmenu" == "n" ] || [ "$helpmenu" == "N" ]; then
        echo
        GOODJOB
    fi
    touch "$target_filepath"/"${ProgType[1]}"-"$(date +'%d%m%y')"-0.txt
    echo "Choose a flag for Strings (Press enter for default extraction):"
    read FLAG
    if [ "$FLAG" = "" ]; then
        if [ -f "$target_filepath/${ProgType[1]}-$(date +''%d%m%y'')-*.txt" ]; then
            echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m\e[1;37m Strings:\e[0m Extracting \e[1;36m"$FILENAME"\e[0m."
            strings $FILENAME > "$target_filepath"/"${ProgType[1]}"-"$(date +'%d%m%y')"-1.txt
        else
            echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m\e[1;37m Strings:\e[0m Extracting \e[1;36m"$FILENAME"\e[0m."
            strings $FILENAME > "$target_filepath"/"${ProgType[1]}"-"$(date +'%d%m%y')"-`ls "$target_filepath"/"${ProgType[1]}"-"$(date +''%d%m%y'')"* 2> /dev/null | wc -l`.txt
        fi
    else
        if [ "$FLAG" != "" ]; then             
            echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m\e[1;37m Strings:\e[0m Extracting \e[1;36m"$FILENAME"\e[0m."
            strings $FLAG $FILENAME > "$target_filepath"/"${ProgType[1]}"-"$(date +'%d%m%y')"-1.txt
        else
            echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m\e[1;37m Strings:\e[0m Extracting \e[1;36m"$FILENAME"\e[0m."
            strings $FLAG $FILENAME > "$target_filepath"/"${ProgType[1]}"-"$(date +'%d%m%y')"-`ls "$target_filepath"/"${ProgType[1]}"-"$(date +''%d%m%y'')"* 2> /dev/null | wc -l`.txt
        fi    
    fi
    clear
    read -s -p "Would you like to view the extracted log file? (y/n) " readlstlog
    if [ "$readlstlog" == "y" ] || [ "$readlstlog" == "Y" ]; then
      lstlog=$(echo $(ls -t /$target_filepath/ | grep ./*.txt | head -1))
      if [ -z "$lstlog" ]; then
        echo -n "
        File is empty."
        rm -r $lstlog > /dev/null 2>&1
        echo
      else 
        less /$target_filepath/$lstlog
        echo
        #Saved file name is presented to user and is saved in the target directory.
        echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m Output created: \e[1;34m$lstlog\e[0m"
      fi    
    fi
    if [ "$readlstlog" == "n" ] || [ "$readlstlog" == "N" ]; then
      echo
      echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m Output created: \e[1;34m$lstlog\e[0m"
    fi
    rm "$target_filepath"/"${ProgType[1]}"-"$(date +'%d%m%y')"-0.txt
    echo
    ;;
  3)
    #BULK_EXTRACTOR
    read -s -p "Need to see the help menu for flags? (y/n):" helpmenu
    if [ "$helpmenu" == "y" ] || [ "$helpmenu" == "Y" ]; then
        bulk_extractor -h | more
        echo
    fi
    if [ "$helpmenu" == "n" ] || [ "$helpmenu" == "N" ]; then
        echo
        GOODJOB
    fi
    mkdir -pv "$target_filepath"/"${ProgType[4]}"-"$(date +'%d%m%y')"/output-0 > /dev/null 2>&1
    echo "Choose a flag for Bulk Extractor (Press enter for default extraction): "
    read FLAG
    if [ "$FLAG" = "" ]; then
        if [ -f "$target_filepath"/"${ProgType[4]}"-"$(date +'%d%m%y')"/output-1 ]; then 
          echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m\e[1;37m Bulk Extractor:\e[0m Extracting \e[1;36m"$FILENAME"\e[0m. This may take some time."
          bulk_extractor $FILENAME --outdir "$target_filepath"/"${ProgType[4]}"-"$(date +'%d%m%y')"/output > /dev/null 2>&1
        else
          echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m\e[1;37m Bulk Extractor:\e[0m Extracting \e[1;36m"$FILENAME"\e[0m. This may take some time."
          bulk_extractor $FILENAME --outdir "$target_filepath"/"${ProgType[4]}"-"$(date +'%d%m%y')"/output > /dev/null 2>&1 `ls "$target_filepath"/"${ProgType[4]}"-"$(date +''%d%m%y'')"/output* 2> /dev/null | wc -l`.txt
        fi
    else
        if [ -f "$target_filepath/${ProgType[4]}-$(date +''%d%m%y'')-*.txt" ]; then
          echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m\e[1;37m Bulk Extractor:\e[0m Extracting \e[1;36m"$FILENAME"\e[0m. This may take some time."
          bulk_extractor $FLAG $FILENAME --outdir "$target_filepath"/"${ProgType[4]}"-"$(date +'%d%m%y')"/output > /dev/null 2>&1
        else
          echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m\e[1;37m Bulk Extractor:\e[0m Extracting \e[1;36m"$FILENAME"\e[0m. This may take some time."
          bulk_extractor $FLAG $FILENAME --outdir "$target_filepath"/"${ProgType[4]}"-"$(date +'%d%m%y')"/output > /dev/null 2>&1 `ls "$target_filepath"/"${ProgType[4]}"-"$(date +''%d%m%y'')"/output* 2> /dev/null | wc -l`.txt
        fi 
    fi
    echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m Output directory created: \e[1;34m$(ls -t $target_filepath | grep bulk | head -1)\e[0m"
    rm -r "$target_filepath"/"${ProgType[4]}"-"$(date +'%d%m%y')"/output-0
    echo
    ;;
  0)
    clear
    echo -e "\e[32mThank you for using \e[1mAnalyzer\e[0m \e[1;32m(AKA - Dumpalyzer v1.1.9)\e[0m"
    echo -e "\e[32mGoodbye!\e[0m"
    exit 1
    ;;
  esac
MEMORYFILEMENU
}

function HDDFILEMENU() 
{
  echo -e "\e[1;37mHDD\e[0m Analyzing options:"
  echo -e "\e[1;37m[\e[0m\e[1;36m1\e[0m\e[1;37m]\e[0m Binwalk"
  echo -e "\e[1;37m[\e[0m\e[1;36m2\e[0m\e[1;37m]\e[0m Strings"
  echo -e "\e[1;37m[\e[0m\e[1;36m3\e[0m\e[1;37m]\e[0m Foremost"
  echo -e "\e[1;37m[\e[0m\e[1;36m4\e[0m\e[1;37m]\e[0m Bulk Extractor"
  echo "——————————————————"
  echo -e "\e[1;37m[\e[0m\e[1;36m0\e[0m\e[1;37m]\e[0m Exit Program"
  echo
  read -p "Choose: " HDD_MENUOPT
  clear
  case $HDD_MENUOPT in
  1)
    #BINWALK
    read -s -p "Need to see the help menu for flags? (y/n):" helpmenu
    if [ "$helpmenu" == "y" ] || [ "$helpmenu" == "Y" ]; then
        binwalk -h
        echo
    fi
    if [ "$helpmenu" == "n" ] || [ "$helpmenu" == "N" ]; then
        echo
        GOODJOB
    fi
    mkdir -pv "$target_filepath"/"${ProgType[3]}"-"$(date +'%d%m%y')"/output > /dev/null 2>&1
    echo "Choose a flag for Binwalk (Press enter for default extraction):"
    read $FLAG
    if [ "$FLAG" = "" ]; then
        binwalk $FILENAME --directory="$target_filepath"/"${ProgType[3]}"-"$(date +'%d%m%y')"/output > /dev/null 2>&1 `ls $target_filepath/${ProgType[3]}-$(date +'%d%m%y')/output* | wc -l` 2> /dev/null
    else
        binwalk $FLAG $FILENAME --directory="$target_filepath"/"${ProgType[3]}"-"$(date +'%d%m%y')"/output > /dev/null 2>&1 `ls $target_filepath/${ProgType[3]}-$(date +'%d%m%y')/output* | wc -l` 2> /dev/null
    fi 
    echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m Output directory created: \e[1;34m$(ls -t $target_filepath | grep binwalk | head -1)\e[0m"
    echo
    ;;
  2)
    #STRINGS
    read -s -p "Need to see the help menu for flags? (y/n):" helpmenu
    if [ "$helpmenu" == "y" ] || [ "$helpmenu" == "Y" ]; then
        strings -h
        echo
    fi
    if [ "$helpmenu" == "n" ] || [ "$helpmenu" == "N" ]; then
        echo
        GOODJOB
    fi
    touch "$target_filepath"/"${ProgType[1]}"-"$(date +'%d%m%y')"-0.txt
    echo "Choose a flag for Strings (Press enter for default extraction):"
    read FLAG
    if [ "$FLAG" = "" ]; then
        if [ -f "$target_filepath/${ProgType[1]}-$(date +''%d%m%y'')-*.txt" ]; then
            echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m\e[1;37m Strings:\e[0m Extracting \e[1;36m"$FILENAME"\e[0m."
            strings $FILENAME > "$target_filepath"/"${ProgType[1]}"-"$(date +'%d%m%y')"-1.txt
        else
            echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m\e[1;37m Strings:\e[0m Extracting \e[1;36m"$FILENAME"\e[0m."
            strings $FILENAME > "$target_filepath"/"${ProgType[1]}"-"$(date +'%d%m%y')"-`ls "$target_filepath"/"${ProgType[1]}"-"$(date +''%d%m%y'')"* 2> /dev/null | wc -l`.txt
        fi
    else
        if [ "$FLAG" != "" ]; then             
            echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m\e[1;37m Strings:\e[0m Extracting \e[1;36m"$FILENAME"\e[0m."
            strings $FLAG $FILENAME > "$target_filepath"/"${ProgType[1]}"-"$(date +'%d%m%y')"-1.txt
        else
            echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m\e[1;37m Strings:\e[0m Extracting \e[1;36m"$FILENAME"\e[0m."
            strings $FLAG $FILENAME > "$target_filepath"/"${ProgType[1]}"-"$(date +'%d%m%y')"-`ls "$target_filepath"/"${ProgType[1]}"-"$(date +''%d%m%y'')"* 2> /dev/null | wc -l`.txt
        fi    
    fi
    clear
    read -s -p "Would you like to view the extracted log file? (y/n) " readlstlog
    if [ "$readlstlog" == "y" ] || [ "$readlstlog" == "Y" ]; then
      lstlog=$(echo $(ls -t /$target_filepath/ | grep ./*.txt | head -1))
      if [ -z "$lstlog" ]; then
        echo -n "
        File is empty."
        rm -r $lstlog > /dev/null 2>&1
        echo
      else 
        less /$target_filepath/$lstlog
        echo
        #Saved file name is presented to user and is saved in the target directory.
        echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m Output created: \e[1;34m$lstlog\e[0m"
      fi    
    fi
    if [ "$readlstlog" == "n" ] || [ "$readlstlog" == "N" ]; then
      echo
      echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m Output created: \e[1;34m$lstlog\e[0m"
    fi
    clear
    rm "$target_filepath"/"${ProgType[1]}"-"$(date +'%d%m%y')"-0.txt
    echo
    ;;
  3)
    #FOREMOST
    read -s -p "Need to see the help menu for flags? (y/n):" helpmenu
    if [ "$helpmenu" == "y" ] || [ "$helpmenu" == "Y" ]; then
        foremost -h
        echo
    fi
    if [ "$helpmenu" == "n" ] || [ "$helpmenu" == "N" ]; then
        echo
        GOODJOB
    fi
    mkdir -pvT "$target_filepath"/"${ProgType[2]}"-"$(date +'%d%m%y')-/output-1" > /dev/null 2>&1
    echo "Choose a flag for Foremost (Press enter for default extraction):"
    read FLAG
    if [ "$FLAG" = "" ]; then
        if [ -f "$target_filepath"/"${ProgType[2]}"-"$(date +'%d%m%y')" ]; then
          echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m\e[1;37m Foremost:\e[0m Extracting \e[1;36m"$FILENAME"\e[0m. This may take some time."
          foremost -T -o "$target_filepath"/"${ProgType[2]}"-/output -i $FILENAME > /dev/null 2>&1
        else
          echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m\e[1;37m Foremost:\e[0m Extracting \e[1;36m"$FILENAME"\e[0m. This may take some time."
          foremost -T -o "$target_filepath"/"${ProgType[2]}"-/output -i $FILENAME > /dev/null 2>&1
        fi
    else
        if [ -f "$target_filepath"/"${ProgType[2]}"-"$(date +'%d%m%y')" ]; then
          echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m\e[1;37m Foremost:\e[0m Extracting \e[1;36m"$FILENAME"\e[0m. This may take some time."
          foremost -T $FLAG -o "$target_filepath"/"${ProgType[2]}"-/output -i $FILENAME > /dev/null 2>&1
        else
          echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m\e[1;37m Foremost:\e[0m Extracting \e[1;36m"$FILENAME"\e[0m. This may take some time."
          foremost -T $FLAG -o "$target_filepath"/"${ProgType[2]}"-/output -i $FILENAME > /dev/null 2>&1
        fi
    fi
    clear
    echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m Output directory created: \e[1;34m$(ls -t $target_filepath | grep foremost | head -1)\e[0m"
    echo
    ;;
  4)
    #BULK_EXTRACTOR
    read -s -p "Need to see the help menu for flags? (y/n):" helpmenu
    if [ "$helpmenu" == "y" ] || [ "$helpmenu" == "Y" ]; then
        bulk_extractor -h | more
        echo
    fi
    if [ "$helpmenu" == "n" ] || [ "$helpmenu" == "N" ]; then
        echo
        GOODJOB
    fi
    mkdir -pv "$target_filepath"/"${ProgType[4]}"-"$(date +'%d%m%y')" > /dev/null 2>&1
    echo "Choose a flag for Bulk Extractor (Press enter for default extraction):"
    read FLAG
    if [ "$FLAG" = "" ]; then
        if [ -f "$target_filepath"/"${ProgType[4]}"-"$(date +'%d%m%y')"/output-1 ]; then 
          echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m\e[1;37m Bulk Extractor:\e[0m Extracting \e[1;36m"$FILENAME"\e[0m. This may take some time."
          bulk_extractor $FILENAME --outdir "$target_filepath"/"${ProgType[4]}"-"$(date +'%d%m%y')"/output > /dev/null 2>&1
        else
          echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m\e[1;37m Bulk Extractor:\e[0m Extracting \e[1;36m"$FILENAME"\e[0m. This may take some time."
          bulk_extractor $FILENAME --outdir "$target_filepath"/"${ProgType[4]}"-"$(date +'%d%m%y')"/output > /dev/null 2>&1 `ls "$target_filepath"/"${ProgType[4]}"-"$(date +''%d%m%y'')"/output* 2> /dev/null | wc -l`.txt
        fi
    else
        if [ -f "$target_filepath/${ProgType[4]}-$(date +''%d%m%y'')-*.txt" ]; then
          echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m\e[1;37m Bulk Extractor:\e[0m Extracting \e[1;36m"$FILENAME"\e[0m. This may take some time."
          bulk_extractor $FLAG $FILENAME --outdir "$target_filepath"/"${ProgType[4]}"-"$(date +'%d%m%y')"/output > /dev/null 2>&1
        else
          echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m\e[1;37m Bulk Extractor:\e[0m Extracting \e[1;36m"$FILENAME"\e[0m. This may take some time."
          bulk_extractor $FLAG $FILENAME --outdir "$target_filepath"/"${ProgType[4]}"-"$(date +'%d%m%y')"/output > /dev/null 2>&1 `ls "$target_filepath"/"${ProgType[4]}"-"$(date +''%d%m%y'')"/output* 2> /dev/null | wc -l`.txt
        fi 
    fi
    echo -e "\e[1;37m[\e[0m\e[1;36m+\e[0m\e[1;37m]\e[0m Output directory created: \e[1;34m$(ls -t $target_filepath | grep bulk | head -1)\e[0m"
    echo
    ;;
  0)
    clear
    echo -e "\e[32mThank you for using \e[1mAnalyzer\e[0m \e[1;32m(AKA - Dumpalyzer v1.1.9)\e[0m"
    echo -e "\e[32mGoodbye!\e[0m"
    sleep 0.5
    exit 1
    ;;
  esac

HDDFILEMENU
}

#Program will start from here, and will run the rest of the functions after the first start function completed.
START
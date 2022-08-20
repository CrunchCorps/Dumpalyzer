# DUMPALYZER v1.2.1

<p align="center">
  <img src="https://github.com/RandomLinoge/Dumpalyzer/blob/28186cf08bf0e1f1a389df358f2c2f5155ee469c/Dumpalyzer-logo-Bak3n3ko.png">
  <p align="center">Forensic Analyzer Tool Designed in Pure Bash to Carve Memory and HDD Files into Organized Logs.</p>
  <p align="center">
  </a>
    <a href="https://github.com/RandomLinoge/Dumpalyzer">
      <img src="https://img.shields.io/badge/Version-1.2.1-blue.svg">
        <img src="https://img.shields.io/badge/Release%20Date-August%202022-informational">
  <img src="https://shields.io/badge/Bash-100%25-red">
  <img src="https://shields.io/badge/Platform-%20Linux-lightgreen">
    </a>
  </p>
</p>

---
Analyzer [A.K.A - Dumpalyzer] is a bash script whose purose is to analyze Memory and HDD files, forensically extract them with five different tools in an interactive mode, and output organized log files.
---
>
>
>  **What is Analyzer?**
>
> Analyzer is a script made in bash, created to analyze Memory and HDD files, extracting them with several prolific forensic tools 
> and organize their output in easy-to-find directories and log files.
>
> Analyzer syntax is composed of two user-defined variables. First is choosing between “MEM” or “HDD”, and the second is he name of the file in need of analyzing.
> ./Analyzer.sh [MEM / HDD] <Filename>
>
> Analyzer can run with bash command without giving it permissions with chmod.
>
> The HDD option attached to the file will send the user into the HDD analyzing menu with its relevant programs.
> The MEM option attached to the file will send the user into the Memory analyzing menu.
>
> Each program will ask the user for the help menu for the flags, so the user could choose from the list what to use with the program before it runs on the file.
> Each time the user will choose not to see the help menu, the script will run a loop between 13 random sentences encrypted before-hand and decrypted 
> to motivate the user for his knowledge of the program’s flags.
>
> Choosing a flag (or pressing “enter” for default extraction), the
> script will extract and present the directory named after binwalk and
> the current date.
>
> After extraction into log file, user is prompt with the question to view the log file in-program.
>
>
> Volatility needs a compatible profile to work, so when the program starts to run it will analyze the file for suggested profiles
> and will ask the user to choose one.
>
> Since Volatility cannot run without a flag, the program will get “stuck” in a while loop until user will chooses a flag. After a few
> times the script will suggest again the help menu.
> Volatility log files can be found among the other log files and extracted directories. New files are not overwritten and followed by a sequential number.
> 
> After each finished extraction, the MEM or HDD menu will be called
> again for the user to choose a different program for analyzing the
> file or to exit.

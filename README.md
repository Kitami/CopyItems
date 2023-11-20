# PowerShell File Copy GUI Wrapper

## Overview

This application serves as a graphical user interface (GUI) wrapper for the built-in `Copy-Item` function in PowerShell. The script simplifies the process of copying files and directories by providing a user-friendly interface.

## Features

- **Source and Destination Selection**: Easily select source and destination folders using dedicated buttons.
- **Exclude Files**: Specify files to be excluded during the copy process.
- **Status Bar**: Monitor the progress and receive status updates during file copying.
- **Start Button**: Initiate the file copy operation with a click of the "Start" button.

## Usage

1. Run the script using PowerShell.
2. The GUI will appear, allowing you to input source and destination paths.
3. Click the "Select" buttons to choose source and destination folders.
4. Optionally, specify files to exclude in the provided text box, separated by commas. You can use the asterisk (*) as a wildcard for matching.
5. Click the "Start" button to begin the copy operation.
6. The status bar will display progress, and a completion message will be shown upon finishing.

## Requirements

- PowerShell

## Notes

This program is a simple interface for the `Copy-Item` function in PowerShell, providing a convenient way to perform file copy operations without the need for command-line input.

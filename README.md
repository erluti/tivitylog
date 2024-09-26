# tivitylog

This gem is a commandline tool to run some simple processes and create a log entry of the process run.  The purpose is to validate other process tracking tools.

## Usage

Five activities are currently supported:
* `tivitylog create [filename]`
  - This will create an empty file with the name provided.
* `tivitylog modify [filename]`
  - This will modify the file named by adding the text "File Modified.".
* `tivitylog delete [filename]`
  - This will delete the named file.
* `tivitylog transmit`
  - This will make an HTTP get to `https://httpbin.org/get`.
* `tivitylog run [unix instruction]`
  - This will run the unix instraction.  For example, "tivitylog run ls -la" will run "ls -la".

## WIP

This is a side project and it's not currently in a finished state.  For this reason you'll find `tivitylog-0.0.0.gem` checked in; it's not ready to go to version 0.0.1 and be released to a gem server.  However I did want to be able to download it and install it on some test systems.

The TODOs for this project include more tests and addional support for command line arguments.

Use at your own risk and this is not intended to be distrubted or modified without permission.

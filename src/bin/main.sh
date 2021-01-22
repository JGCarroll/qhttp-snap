#!/bin/bash

# Copyright 2021 James Carroll

# Permission is hereby granted, free of charge, to any person obtaining a copy of this software #and associated documentation files (the "Software"), to deal in the Software without #restriction, including without limitation the rights to use, copy, modify, merge, publish, #distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the #Software is furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all copies or #substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING #BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, #DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING #FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

port=8000

function help(){
	echo "Options: "
	echo "-p Specify the port to bind to"
}

while getopts ":p:" opt; do
	case ${opt} in
		p )
			port=${OPTARG}
			;;
		\? )	# Unknown option
			echo "Unknown option: ${OPTARG}"
			help
			exit 1
			;;
		: )	# Missing arguement to an option
			echo "${OPTARG} requires a parameter"
			help
			exit 1
			;;
	esac
done

if ! xdg-open http://127.0.0.1:${port}
then
	echo "Attempting to open the browser failed, but the server might still work"
	echo "This might happen if you're running this with sudo, a none graphical session, are lacking xdg-desktop portal support or have disabled the desktop interface"
fi

echo "Attempting to serve files from ${SNAP_USER_COMMON}, press control + c to exit"
python3 -m http.server ${port} --directory $SNAP_USER_COMMON

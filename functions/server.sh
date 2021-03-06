#!/bin/zsh

#-------------------------------------------------------------
# Start an HTTP server from current directory, optionally
# specifying the port
#
# Globals:
#   None
# Arguments:
#   $1 - Port
# Example:
#   `server` - Start server on default port (8000)
#   `server 8181` - Start server on port 8181
#-------------------------------------------------------------

function server() {
	local port="${1:-8000}";

	sleep 1 && open "http://localhost:${port}/" &
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# alias server='python -m SimpleHTTPServer
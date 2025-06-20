function killport
    if test (count $argv) -eq 0 -o $argv[1] = '-h' -o $argv[1] = '--help'
        echo "Usage: killport <port>"
        echo "Kills all processes listening on the specified port."
        return 0
    end

    set port $argv[1]
    set pids (lsof -ti :$port)
    if test (count $pids) -gt 0
        kill -9 $pids
        echo "Killed processes on port $port: $pids"
    else
        echo "No processes found on port $port"
    end
end

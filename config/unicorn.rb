working_directory "/home/deploy/my-urban"

pid "/home/deploy/my-urban/shared/pids/unicorn.pid"

stderr_path "/home/deploy/my-urban/shared/log/unicorn.log"
stdout_path "/home/deploy/my-urban/shared/log/unicorn.log"

listen "/tmp/unicorn.myurban.sock"

worker_processes 2

timeout 30

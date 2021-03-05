function fish_prompt
    # set -l __last_command_exit_status $status

    printf '\n%s %s\n ' $PWD (fish_git_prompt)
end

function fish_prompt
    set -l user_host "$USER@"(prompt_hostname)
    set -l dir (prompt_pwd -d 1)
    set -l vcs (fish_git_prompt '%s' 2>/dev/null)

    set_color yellow --bold
    echo -n "$user_host "

    set_color white --bold
    echo -n "$dir"

    if test -n "$vcs"
        set_color normal --bold
        echo -n "$vcs"
    end

    set_color yellow --bold
    echo -n " › "
    set_color normal
end

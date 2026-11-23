# Select a local repository and change this shell's working directory.
def --env repos [] {
    let candidates = (^ghq list -p)
    let selection = ($candidates | ^fzf --no-multi | complete)
    match $selection.exit_code {
        0 => { cd ($selection.stdout | str trim --right --char "\n" | str trim --right --char "\r") }
        1 | 130 => {}
        _ => { error make {msg: $"fzf failed: ($selection.stderr | str trim)"} }
    }
}

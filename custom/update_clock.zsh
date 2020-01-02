# simple function to update the time in the prompt
TRAPALRM() {
    #echo "$WIDGET"
    # vi-history-search-{forward,backward}
    #if [ "$WIDGET" ~= "expand-or-complete" || "$WIDGET" ~= "^vi-history-seach.*" ]; then
    if [ "$WIDGET" != "expand-or-complete" ]; then
        zle reset-prompt
    fi
}
TMOUT=1 # set to 30 to prevent autocomplete bug
 

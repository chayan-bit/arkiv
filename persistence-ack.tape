Output "$ARKIV_CONTRIB/demos/persistence-ack.gif"
Set Shell "bash"
Set FontSize 15
Set Width 1300
Set Height 720
Set TypingSpeed 25ms
Set Theme "Builtin Dark"
Hide
Type "export PS1='$ ' HISTFILE=/dev/null; cd $ARKIV_CONTRIB/wt/persistence-ack" Enter
Type "run_test(){ $ARKIV_CONTRIB/tools/remote.sh $ARKIV_CONTRIB/wt/persistence-ack cargo test -q --locked -p arkiv-reth-statemanager persistence::tests 2>&1 | grep -E '^test |test result:|panicked at|left:|right:|assertion' | grep -v ' 0 passed; 0 failed' ; }" Enter
Type "clear" Enter
Show
Type "# persistence acknowledged blocks the Arkiv store never committed" Enter
Sleep 500ms
Type "git log --oneline -2" Enter
Sleep 2s
Type "git checkout -q HEAD~1   # only the new test, no fix" Enter
Sleep 1500ms
Type "run_test   # cargo test -p arkiv-reth-statemanager persistence::tests" Enter
Wait+Screen@15m /test result: FAILED/
Sleep 3s
Type "git checkout -q -   # with the fix" Enter
Sleep 1500ms
Type "run_test" Enter
Wait+Screen@15m /test result: ok/
Sleep 4s

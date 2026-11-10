Output "$ARKIV_CONTRIB/demos/view-call-gas.gif"
Set Shell "bash"
Set FontSize 15
Set Width 1300
Set Height 720
Set TypingSpeed 25ms
Set Theme "Builtin Dark"
Hide
Type "export PS1='$ ' HISTFILE=/dev/null; cd $ARKIV_CONTRIB/wt/view-call-gas" Enter
Type "run_test(){ $ARKIV_CONTRIB/tools/remote.sh $ARKIV_CONTRIB/wt/view-call-gas cargo test -q --locked -p arkiv-reth-executor mined_view_call_pays 2>&1 | grep -E '^test |test result:|panicked at|left:|right:|assertion' | grep -v ' 0 passed; 0 failed' ; }" Enter
Type "clear" Enter
Show
Type "# a mined view call paid flat gas whatever the size of the entity it read" Enter
Sleep 500ms
Type "git log --oneline -2" Enter
Sleep 2s
Type "git checkout -q HEAD~1   # only the new test, no fix" Enter
Sleep 1500ms
Type "run_test   # cargo test -p arkiv-reth-executor mined_view_call_pays" Enter
Wait+Screen@15m /test result: FAILED/
Sleep 3s
Type "git checkout -q -   # with the fix" Enter
Sleep 1500ms
Type "run_test" Enter
Wait+Screen@15m /test result: ok/
Sleep 4s

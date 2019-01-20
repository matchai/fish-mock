function setup
  set root (dirname (status -f))
  source $root/functions/mock.fish
  source $root/functions/unmock.fish
end

test "$TESTNAME - It should unmock a previously created mock"
   "hello joe" = (mock echo \* 0 "echo fail"; and unmock echo; and echo "hello joe")
end

test "$TESTNAME - It should unmock a previously created mock with non-wildcard"
   "hi" = (mock echo hi 0 "echo fail"; and unmock echo; and echo hi)
end

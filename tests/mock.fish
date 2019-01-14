function setup
  set root (dirname (status -f))
  source $root/mock.fish
end

test "$TESTNAME It should be able to mock with exit success"
  (mock ls \*; and ls) $status -eq 0
end

test "$TESTNAME It should be able to non-wildcard mock with exit success"
  (mock ls a; and ls a) $status -eq 0
end

test "$TESTNAME It should be able to mock with fail status"
   (mock ls \* 1; and ls) $status -eq 1
end

test "$TESTNAME It should be able to non-wildcard mock with fail status"
   (mock ls a 1; and ls a) $status -eq 1
end

test "$TESTNAME It should be able to mock with function body"
   hello = (mock ls \* 0 "echo hello"; and ls )
end

test "$TESTNAME It should be able to non-wildcard mock with function body"
   hello = (mock ls a 0 "echo hello"; and ls a )
end

test "$TESTNAME It should be able to use argument"
   "hello joe" = (mock ls \* 0 "echo hello \$args"; and ls joe )
end

test "$TESTNAME It should be able to use argument in non-wildcard mock"
   "hello joe" = (mock ls a 0 "echo hello \$args"; and ls a joe )
end

test "$TESTNAME It should be able to use some arguments"
   "hello joe" = (mock ls \* 0 "echo hello \$args[1]"; and ls joe mike )
end

test "$TESTNAME It should be able to use some arguments in non-wildcard mock"
   "hello joe" = (mock ls a 0 "echo hello \$args[1]"; and ls a joe mike )
end

test "$TESTNAME It should be able to use multiple arguments"
   "hello joe and mike" = (mock ls \* 0 "echo hello \$args[1] and \$args[2]"; and ls joe mike )
end

test "$TESTNAME It should be able to use multiple arguments in non-wildcard mock"
   "hello joe and mike" = (mock ls a 0 "echo hello \$args[1] and \$args[2]"; and ls a joe mike )
end

test "$TESTNAME It should be able to use nested functions"
   "1 2 3 4 5" = (mock ls \* 0 "echo (seq 5)"; and ls )
end

test "$TESTNAME It should be able to use nested functions in non-wildcard mock"
   "1 2 3 4 5" = (mock ls a 0 "echo (seq 5)"; and ls a )
end

test "$TESTNAME It should be able to use nested functions with arguments"
   "1 2 3 4 5" = (mock ls \* 0 "echo (seq \$args)"; and ls 5)
end

test "$TESTNAME It should be able to use nested functions in non-wildcard mock with arguments"
   "1 2 3 4 5" = (mock ls a 0 "echo (seq \$args)"; and ls a 5)
end

test "$TESTNAME It should not mock blacklisted elements 1"
   (mock builtin \*) = "The function \"builtin\" is reserved and therefore cannot be mocked." -a $status -eq 1
end

test "$TESTNAME It should not mock blacklisted elements 2"
   (mock functions \*) = "The function \"functions\" is reserved and therefore cannot be mocked." -a $status -eq 1
end

test "$TESTNAME It should not mock blacklisted elements 3"
   (mock eval \*) = "The function \"eval\" is reserved and therefore cannot be mocked." -a $status -eq 1
end

test "$TESTNAME It should not mock blacklisted elements 4"
   (mock "[" \*) = "The function \"[\" is reserved and therefore cannot be mocked." -a $status -eq 1
end

test "$TESTNAME Unmock previously created mock"
   "hello joe" = (mock echo \* 0 "echo fail"; and unmock echo; and echo "hello joe")
end

test "$TESTNAME Unmock previously created mock with non-wildstar"
   "hi" = (mock echo hi 0 "echo fail"; and unmock echo; and echo hi)
end

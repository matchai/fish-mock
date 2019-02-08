function setup
    set root (dirname (status -f))
    source $root/functions/mock.fish
end

@test "It should be able to mock with exit success" (
   mock ls \*; and ls
) $status -eq 0

@test "It should be able to non-wildcard mock with exit success" (
   mock ls a; and ls a
) $status -eq 0

@test "It should be able to mock with fail status" (
   mock ls \* 1; and ls
) $status -eq 1

@test "It should be able to non-wildcard mock with fail status" (
   mock ls a 1; and ls a
) $status -eq 1

@test "It should be able to mock with function body" (
   mock ls \* 0 "echo hello"; and ls 
) = "hello"

@test "It should be able to non-wildcard mock with function body" (
   mock ls a 0 "echo hello"; and ls a 
) = "hello"

@test "It should be able to use argument" (
   mock ls \* 0 "echo hello \$args"; and ls joe 
) = "hello joe"

@test "It should be able to use argument in non-wildcard mock" (
   mock ls a 0 "echo hello \$args"; and ls a joe
) = "hello joe"

@test "It should be able to use some arguments" (
   mock ls \* 0 "echo hello \$args[1]"; and ls joe mike
) = "hello joe"

@test "It should be able to use some arguments in non-wildcard mock" (
   mock ls a 0 "echo hello \$args[1]"; and ls a joe mike 
) = "hello joe"

@test "It should be able to use multiple arguments" (
   mock ls \* 0 "echo hello \$args[1] and \$args[2]"; and ls joe mike
) = "hello joe and mike"

@test "It should be able to use multiple arguments in non-wildcard mock" (
   mock ls a 0 "echo hello \$args[1] and \$args[2]"; and ls a joe mike
) = "hello joe and mike"

@test "It should be able to use nested functions" (
   mock ls \* 0 "echo (seq 5)"; and ls 
) = "1 2 3 4 5"

@test "It should be able to use nested functions in non-wildcard mock" (
   mock ls a 0 "echo (seq 5)"; and ls a
) = "1 2 3 4 5"

@test "It should be able to use nested functions with arguments" (
   mock ls \* 0 "echo (seq \$args)"; and ls 5
) = "1 2 3 4 5"

@test "It should be able to use nested functions in non-wildcard mock with arguments" (
   mock ls a 0 "echo (seq \$args)"; and ls a 5
) = "1 2 3 4 5"

@test "It should not mock blacklisted elements 1" (
   echo (
      mock builtin \*
      echo $status
   )
) = "The function \"builtin\" is reserved and therefore cannot be mocked. 1"

@test "It should not mock blacklisted elements 2" (
   echo (
      mock functions \*
      echo $status
   )
) = "The function \"functions\" is reserved and therefore cannot be mocked. 1"

@test "It should not mock blacklisted elements 3" (
   echo (
      mock eval \*
      echo $status
   )
) = "The function \"eval\" is reserved and therefore cannot be mocked. 1"

@test "It should not mock blacklisted elements 4" (
   echo (
      mock "[" \*
      echo $status
   )
) = "The function \"[\" is reserved and therefore cannot be mocked. 1"

function unmock -a cmd -d "Destroy an existing mock"
  if test (count $argv) -lt 1
      echo "
Usage
  \$ unmock <command>

Arguments
  command        The command you would like to unmock

Examples
  \$ unmock git   # The original git command can now be used
"
    return 0
  end

  functions -e $cmd
  set -l mocked_args "_mocked_"$cmd"_args"
  functions -e "mocked_"$cmd"_fn_"{$$mocked_args}
  set -e $mocked_args
  set _mocked (string match -v $cmd $_mocked)
  return 0
end

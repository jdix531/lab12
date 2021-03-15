#!/bin/bash
function get_stack_status () {
  echo $(aws cloudformation describe-stacks --stack-name lab-12-1-2-jdix | jq -r '.Stacks[0].StackStatus')
}
stack_status=$(get_stack_status)
if [[ "$stack_status" == "CREATE_COMPLETE" || "$stack_status" == "UPDATE_COMPLETE" ]]; then
  echo "stack in good health, status=$stack_status"
  exit 0
else
  echo "stack is not in good health, status=$stack_status"
  exit 1
fi

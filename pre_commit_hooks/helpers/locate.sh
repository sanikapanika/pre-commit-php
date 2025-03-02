################################################################################
#
# Locate the command from a list of options
#
################################################################################

# Final location of the executable that we found by searching
exec_command=""

# A phar file will need to be called by php
prefixed_local_command="php $local_command"

if [ -f "$shopware_command" ]; then
    exec_command=$shopware_command
elif [ -f "$vendor_command" ]; then
    exec_command=$vendor_command
elif [ -f "$bin_command" ]; then
    exec_command=$bin_command
elif hash $global_command 2>/dev/null; then
    exec_command=$global_command
elif [ -f "$local_command" ]; then
    exec_command=$prefixed_local_command
else
    echo -e "${bldred}No valid ${title} found!${txtrst}"
    echo "Please have one available as one of the following:"
    echo " * $shopware_command"
    echo " * $local_command"
    echo " * $vendor_command"
    echo " * $global_command"
    echo " * $bin_command"
    exit 1
fi

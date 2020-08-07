# Outline of files

1. **etc** `/etc`

   - Contains system related configuration files.

2. **home** `/home/{user}/` or `$HOME`

   - Rename files to prepend a _dot_ `.` at the beginning of each file; should be hidden afterwards.

3. **home_dot_config** `/home/{user}/.config/` or `$HOME/.config/`

   - Configuration files for user applications are stored in `.config` folder within `$HOME`.
     Various applications require sub-folders in `.config` and are not necessarily hidden.

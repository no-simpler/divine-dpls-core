#:title:        Divine deployment: config-shell
#:author:       Grove Pyree
#:email:        grayarea@protonmail.ch
#:revnumber:    1.0.0-RELEASE
#:revdate:      2019.06.30
#:revremark:    Release version
#:created_at:   2019.06.30

D_DPL_NAME='config-shell'
D_DPL_DESC='Startup commands for common shells (Bash, zsh)'
D_DPL_PRIORITY=333
D_DPL_FLAGS=
D_DPL_WARNING=

D_BLANKS_DIRNAME='blanks'
D_BLANK_RELPATHS=( \
  '.runcoms.bash' \
  '.runcoms.sh' \
  '.runcoms.zsh' \
  '.hushlogin' \
)

D_DPL_TARGET_DIR="$HOME"

# Delegate to built-in checking routine
dcheck()
{
  # Compile task names; and split queue in two parts
  D_DPL_TASK_NAMES+=( runcoms )
  D_DPL_TASK_NAMES+=( blanks )

  # Split queue in two parts: first is done via manifest; second — manually
  d_add_blanks_to_queue

  # Delegate to built-in helper
  __multitask_hlp__dcheck
}

# dinstall and dremove are fully delegated to built-in helpers
dinstall()  {   __multitask_hlp__dinstall;  }
dremove()   {   __multitask_hlp__dremove;   }

# Implement primaries for runcoms
d_runcoms_dcheck()    { __dln_hlp__dcheck;    }
d_runcoms_dinstall()  { __dln_hlp__dinstall;  }
d_runcoms_dremove()   { __dln_hlp__dremove;   }

# Implement primaries for blanks
d_blanks_dcheck()     { __cp_hlp__dcheck;     }
d_blanks_dinstall()   { __cp_hlp__dinstall;   }
d_blanks_dremove()    { __cp_hlp__dremove;    }

# Add second chunk of the queue
d_add_blanks_to_queue()
{
  # Split queue at current length (which is number of items in manifest)
  __split_queue

  # Compose path to directory containing blank files
  local blanks_dir="$D_DPL_DIR/$D_BLANKS_DIRNAME"

  # Storage variable
  local relpath

  # Add files to main queue and other arrays
  for relpath in "${D_BLANK_RELPATHS[@]}"; do
    D_DPL_QUEUE_MAIN+=( "$relpath" )
    D_DPL_ASSET_RELPATHS+=( "$relpath" )
    D_DPL_ASSET_PATHS+=( "$blanks_dir/$relpath" )
    D_DPL_TARGET_PATHS+=( "$D_DPL_TARGET_DIR/$relpath" )
  done
}
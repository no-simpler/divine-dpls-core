#:title:        Divine deployment: config-vim
#:author:       Grove Pyree
#:email:        grayarea@protonmail.ch
#:revnumber:    1.0.0-RELEASE
#:revdate:      2019.06.30
#:revremark:    Release version
#:created_at:   2019.06.30

D__DPL_NAME='config-vim'
D__DPL_DESC='Vim - configuration and startup commands'
D__DPL_PRIORITY=333
D__DPL_FLAGS=
D__DPL_WARNING=

D__DPL_TARGET_DIR="$HOME"

# Delegate to built-in helpers
dcheck()    { __dln_hlp__dcheck;    }
dinstall()  { __dln_hlp__dinstall;  }
dremove()   { __dln_hlp__dremove;   }
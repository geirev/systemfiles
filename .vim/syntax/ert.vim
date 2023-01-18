if exists('b:ert') | finish|  endif
syntax match ErtComment "--.*$"
highlight ErtComment   ctermfg=cyan guifg=#00ffff

syntax match ErtVariables "<\zs[^>]\+\ze>"
highlight ErtVariables ctermfg=red  guifg=#ff0000

" Integer with - + or nothing in front
syn match celNumber '\d\+'
syn match celNumber '[-+]\d\+'
" Floating point number with decimal no E or e
syn match celNumber '[-+]\d\+\.\d*'
" Floating point like number with E and no decimal point (+,-)
syn match celNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+'
syn match celNumber '\d[[:digit:]]*[eE][\-+]\=\d\+'
" Floating point like number with E and decimal point (+,-)
syn match celNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'
syn match celNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+'

syntax match swiftNumber "\v<\d+>"
""syntax match swiftNumber "\v<\d+\.\d+>"
""syntax match swiftNumber "\v<\d*\.?\d+([Ee]-?)?\d+>"

syn keyword ErtKeywords ADD_FIXED_LENGTH_SCHEDULE_KW
syn keyword ErtKeywords ADD_STATIC_KW
syn keyword ErtKeywords ANALYSIS_COPY
syn keyword ErtKeywords ANALYSIS_LOAD
syn keyword ErtKeywords ANALYSIS_SELECT
syn keyword ErtKeywords ANALYSIS_SET_VAR
syn keyword ErtKeywords ARG_TYPE
syn keyword ErtKeywords CASE_TABLE
syn keyword ErtKeywords CONTAINER
syn keyword ErtKeywords DATA_FILE
syn keyword ErtKeywords DATA_KW
syn keyword ErtKeywords DBASE_TYPE
syn keyword ErtKeywords DEFINE
syn keyword ErtKeywords DEFINE INSTALL_JOB LOAD_WORKFLOW LOAD_WORKFLOW_JOB
syn keyword ErtKeywords ECLBASE
syn keyword ErtKeywords END_DATE
syn keyword ErtKeywords ENKF_ALPHA
syn keyword ErtKeywords ENKF_BOOTSTRAP
syn keyword ErtKeywords ENKF_CROSS_VALIDATION
syn keyword ErtKeywords ENKF_CV_FOLDS
syn keyword ErtKeywords ENKF_FORCE_NCOMP
syn keyword ErtKeywords ENKF_KERNEL_FUNCTION
syn keyword ErtKeywords ENKF_KERNEL_PARAM
syn keyword ErtKeywords ENKF_KERNEL_REGRESSION
syn keyword ErtKeywords ENKF_LOCAL_CV
syn keyword ErtKeywords ENKF_MERGE_OBSERVATIONS
syn keyword ErtKeywords ENKF_MODE
syn keyword ErtKeywords ENKF_NCOMP
syn keyword ErtKeywords ENKF_PEN_PRESS
syn keyword ErtKeywords ENKF_RERUN
syn keyword ErtKeywords ENKF_SCALING
syn keyword ErtKeywords ENKF_SCHED_FILE
syn keyword ErtKeywords ENKF_TRUNCATION
syn keyword ErtKeywords ENSPATH
syn keyword ErtKeywords EQUIL_INIT_FILE
syn keyword ErtKeywords EXECUTABLE
syn keyword ErtKeywords FIELD
syn keyword ErtKeywords FORWARD_MODEL
syn keyword ErtKeywords FUNCTION
syn keyword ErtKeywords GEN_DATA
syn keyword ErtKeywords GEN_KW
syn keyword ErtKeywords GEN_KW_TAG_FORMAT
syn keyword ErtKeywords GEN_PARAM
syn keyword ErtKeywords GRID
syn keyword ErtKeywords HISTORY_SOURCE
syn keyword ErtKeywords HOST_TYPE
syn keyword ErtKeywords IGNORE_SCHEDULE
syn keyword ErtKeywords IMAGE_TYPE
syn keyword ErtKeywords IMAGE_VIEWER
syn keyword ErtKeywords INCLUDE
syn keyword ErtKeywords INIT_SECTION
syn keyword ErtKeywords INSTALL_JOB
syn keyword ErtKeywords INTERNAL
syn keyword ErtKeywords ITER_CASE
syn keyword ErtKeywords ITER_COUNT
syn keyword ErtKeywords JOBNAME
syn keyword ErtKeywords JOB_SCRIPT
syn keyword ErtKeywords LICENSE_PATH
syn keyword ErtKeywords LOAD_SEED
syn keyword ErtKeywords LOAD_WORKFLOW
syn keyword ErtKeywords LOAD_WORKFLOW_JOB
syn keyword ErtKeywords LOCAL_CONFIG
syn keyword ErtKeywords LOG_FILE
syn keyword ErtKeywords LOG_LEVEL
syn keyword ErtKeywords LSF_QUEUE
syn keyword ErtKeywords LSF_RESOURCES
syn keyword ErtKeywords LSF_SERVER
syn keyword ErtKeywords MAX_ARG
syn keyword ErtKeywords MAX_RESAMPLE
syn keyword ErtKeywords MAX_RUNNING_LOCAL
syn keyword ErtKeywords MAX_RUNNING_LSF
syn keyword ErtKeywords MAX_RUNNING_RSH
syn keyword ErtKeywords MAX_RUNTIME
syn keyword ErtKeywords MAX_SUBMIT
syn keyword ErtKeywords MIN_ARG
syn keyword ErtKeywords MIN_REALIZATIONS
syn keyword ErtKeywords MODULE
""syn keyword ErtKeywords NUM_REALIZATIONS nextgroup=TESTING skipwhite
syn keyword ErtKeywords NUM_REALIZATIONS
syn keyword ErtKeywords OBS_CONFIG
syn keyword ErtKeywords PLOT_DRIVER
syn keyword ErtKeywords PLOT_ERRORBAR
syn keyword ErtKeywords PLOT_ERRORBAR_MAX
syn keyword ErtKeywords PLOT_HEIGHT
syn keyword ErtKeywords PLOT_PATH
syn keyword ErtKeywords PLOT_REFCASE
syn keyword ErtKeywords PLOT_REFCASE_LIST
syn keyword ErtKeywords PLOT_WIDTH
syn keyword ErtKeywords QC_PATH
syn keyword ErtKeywords QC_WORKFLOW
syn keyword ErtKeywords QUEUE_OPTION
syn keyword ErtKeywords QUEUE_SYSTEM
syn keyword ErtKeywords REFCASE
syn keyword ErtKeywords REFCASE_LIST
syn keyword ErtKeywords RERUN_START
syn keyword ErtKeywords RESULT_PATH
syn keyword ErtKeywords RFTPATH
syn keyword ErtKeywords RSH_COMMAND
syn keyword ErtKeywords RSH_HOST
syn keyword ErtKeywords RUNPATH
syn keyword ErtKeywords RUNPATH_FILE
syn keyword ErtKeywords RUN_TEMPLATE
syn keyword ErtKeywords SCHEDULE_FILE
syn keyword ErtKeywords SCHEDULE_PREDICTION_FILE
syn keyword ErtKeywords SELECT_CASE
syn keyword ErtKeywords SETENV
syn keyword ErtKeywords SINGLE_NODE_UPDATE
syn keyword ErtKeywords STD_CUTOFF
syn keyword ErtKeywords STOP_LONG_RUNNING
syn keyword ErtKeywords STORE_SEED
syn keyword ErtKeywords SUMMARY
syn keyword ErtKeywords SURFACE
syn keyword ErtKeywords TORQUE_QUEUE
syn keyword ErtKeywords UMASK
syn keyword ErtKeywords UPDATE_LOG_PATH
syn keyword ErtKeywords UPDATE_PATH
syn keyword ErtKeywords UPDATE_RESULTS
syn keyword ErtKeywords WORKFLOW_JOB_DIRECTORY

syn keyword ErtKeywords SIMULATION_JOB
syn keyword ErtKeywords TIME_MAP
syn keyword ErtKeywords RANDOM_SEED

hi ErtKeywords ctermfg=darkgreen


syn keyword IES IES_ENKF
syn keyword IES STD_ENKF
hi IES ctermfg=blue

syn keyword IESKeywords LOCALIZATION
syn keyword IESKeywords LOCALIZATION_CORRELATION_THRESHOLD

syn keyword IESKeywords ENKF_SUBSPACE_DIMENSION
syn keyword IESKeywords ENKF_TRUNCATION
syn keyword IESKeywords IES_MAX_STEPLENGTH
syn keyword IESKeywords IES_MIN_STEPLENGTH
syn keyword IESKeywords IES_DEC_STEPLENGTH
syn keyword IESKeywords IES_INVERSION
syn keyword IESKeywords IES_DEBUG
syn keyword IESKeywords IES_AAPROJECTION
syn keyword IESKeywords IES_LOGFILE
hi IESKeywords ctermfg=yellow

""let b:current_syntax = "cel"
""hi def link celTodo        Todo
""hi def link celComment     Comment
""hi def link celBlockCmd    Statement
""hi def link celHip         Type
""hi def link celString      Constant
""hi def link celDesc        PreProc
""hi def link celNumber      Constant
hi def link swiftNumber      Constant

# data file format (see plugins/readers)
FORMAT='su'

WORKFLOW='inversion'    # inversion, migration, modeling
SOLVER='specfem2d'      # specfem2d, specfem3d
SYSTEM='multicore'       # serial, pbs, slurm
OPTIMIZE='LBFGS'     # base
PREPROCESS='base'  # base
POSTPROCESS='base'   # base

MISFIT='Waveform'
#MISFIT='Envelope'
#MATERIALS='phi_beta'
MATERIALS='Elastic'
DENSITY='Constant'


# WORKFLOW
BEGIN=1                 # first iteration
END=100                  # last iteration
NREC=500                # number of receivers
NSRC=32                 # number of sources
SAVEGRADIENT=1          # save gradient how often
SAVEMODEL=1				# default=1
SAVEKERNELS=0			# default=0
SAVETRACES=1			# default=0
SAVERESIDUAL=1			# default=0

# PREPROCESSING
READER='su_specfem2d'   # data file format
CHANNELS='z'           # data channels
NORMALIZE='NormalizeEventsL2'             # normalize
#NORMALIZE='NormalizeTracesL2'             # normalize
BANDPASS=0              # bandpass
#MUTE='MuteShortOffsets'                  # mute direct arrival
MUTE='MuteLateArrivals'                  # mute direct arrival
FREQLO=0.               # low frequency corner
FREQHI=0.               # high frequency corner
#MUTECONST=0.75          # mute constant
#MUTESLOPE=1500.         # mute slope
MUTECONST=0.	         # mute constant
MUTESLOPE=0.	         # mute slope
#MUTE_SHORT_OFFSETS_DIST=500.
MUTE_LATE_ARRIVALS_SLOPE=0.00095
MUTE_LATE_ARRIVALS_CONST=0.01
#MUTE_LATE_ARRIVALS_CONST=0.18
#FILTER='Bandpass'
#FREQMIN=1
#FREQMAX=10

# OPTIMIZATION
STEPMAX=10              # maximum trial steps
STEPTHRESH=0.1          # step length safeguard


# POSTPROCESSING
SMOOTH=10.               # smoothing radius
SCALE=1.                # scaling factor


# SOLVER
NT=5556                 # number of time steps
DT=9.0e-4               # time step
F0=5.0                  # dominant frequency


# SYSTEM
NTASK=NSRC              # number of tasks
NPROC=1                 # processors per task
WALLTIME=500            # walltime


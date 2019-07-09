# data file format (see plugins/readers)
FORMAT='su'

WORKFLOW='inversion'    # inversion, migration, modeling
#SOLVER='specfem2d'      # specfem2d, specfem3d
SOLVER='elastic'      # specfem2d, specfem3d
#SOLVER='lambda_mu_2d'      # specfem2d, specfem3d
SYSTEM='multicore'       # serial, pbs, slurm
#SYSTEM='bixiegpu_sm'       # serial, pbs, slurm
OPTIMIZE='LBFGS'     # base
PREPROCESS='base'  # base
POSTPROCESS='base'   # base
#POSTPROCESS='tikhonov1'   # 1st order tikhonov

MISFIT='Waveform'
#MATERIALS='phi_beta'
MATERIALS='kappa_mu'
#MATERIALS='alpha_beta'
#MATERIALS='Elastic'
DENSITY='Constant'


# WORKFLOW
BEGIN=1                 # first iteration
END=50                  # last iteration
NREC=410                # number of receivers
#NSRC=10	                # number of sources
NSRC=40	                # number of sources
SAVEGRADIENT=1          # save gradient how often
SAVEMODEL=1				# default=1
SAVEKERNELS=1			# default=0
SAVETRACES=1			# default=0
SAVERESIDUAL=1			# default=0

# PREPROCESSING
READER='su_specfem2d'   # data file format
CHANNELS='z'           # data channels
NORMALIZE='NormalizeEventsL2'             # normalize
BANDPASS=0              # bandpass
MUTE='MuteShortOffsets'                  # mute direct arrival
FREQLO=0.               # low frequency corner
FREQHI=0.               # high frequency corner
#MUTECONST=0.75          # mute constant
#MUTESLOPE=1500.         # mute slope
MUTECONST=0.	         # mute constant
MUTESLOPE=0.	         # mute slope
MUTE_SHORT_OFFSETS_DIST=1000.

# OPTIMIZATION
STEPMAX=10              # maximum trial steps
STEPTHRESH=0.1          # step length safeguard


# POSTPROCESSING
SMOOTH=10.               # smoothing radius
#SMOOTH=0.               # smoothing radius
SCALE=1.                # scaling factor
#FIXRADIUS=15			# correct near field artifacts
#LAMBDA=1.0

# SOLVER
NT=6000                 # number of time steps
DT=8.0e-4               # time step
F0=5.0                  # dominant frequency


# SYSTEM
NTASK=NSRC                 # number of tasks
NGPU=4
NPROC=1                 # processors per task
TASKTIME=10             # walltime for simulation
WALLTIME=30				# walltime for entire simulation
NODESIZE=1              # number of cores per node
NPROCMAX=40

## SPT_analysis_functions
Library of functions to analyse SPT data

1. XY scatter of trajectory
2. velocity historgam
3. displacement from origin and cumulative displacement
4. MSD vs. lag time plot --> plot to retrieve diffusion coefficients (lag time 1-10)
5. identify confinement according to: Simson, et al. (1995), Biophysical Journal, 69(September), 989?993. 
6. identify confined areas according to confinement index (pre-define threshold)
         a. measure dwell time
         b. MSD and calculation of diffucion coefficient (linear model and confined model (LS fitting))
 
         
Input parameters as indicated:
  
* pos variable including (x,y,t)
* dt- time step 
* dx - pixel size
* segment - length of the segemnt for confinement index
* D - diffusion coefficient for confinement index
* threshold - threshold for the dwell time analysis

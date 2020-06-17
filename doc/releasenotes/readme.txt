Signal Inspector

Written By: Jonathan Shulgach
Last Updated: 5/27/2020
Contact: jonathan@shulgach.com

v1.5.27.20

This interactive signal analysis program utilizes the neuroshare matlab toolbox and dynamic parameters to provide 
an easier experience with data processing

==================== Dependencies ==================
Signal Processing Toolbox

======================= QuickStart =====================
1) Install app
2) Navigate to apps in matlab environment and select app to run




====================== Release Notes ====================
v1.5.27.20
Added Features:
- Updated structure to h5 file types as 2D datasets
- X-axis linked across figures using interactive graphic panel
- Interactive panel and GUI time/amplitude inputs linked

Fixed Bugs
- Fixed issue with stuck file type 
- raw data, filtered data, and spike data end with leading whitespace when time was minutes or hours.
- Themes needed to be re-linked to new figure panels
- Figures wouldn't adjust when filter settings changed

v1.5.20.20
Added Features:
- Unique sampling rate saved for each channel depending on file type, adjusted when updating figures
- Automatic amplitude adjustment for raw signal figure

Fixed Bugs
- Cleaning signal couldn't detect artifacts 
- Channels with different sampling rate would mess with the figure windows

v1.5.18.20
Fixed Bugs
- Cleaning signal fixed value threshold couldn't clean signals with large values. Now 
    changed to percent difference.
- ylim linked for filt,spike, and bin figures had different range than raw, now unlinked 
- sample rate fixed at startup, now adjusts to file type

v1.5.16.20
Added Features:
- New UI Name (Pitt SPARC Signal Inspector)
- Themes added to match between main menu and save menu
- Channels can be added as list as well as comma separated
- Able to save data as .h5 file type 
- Dynamic time bounds detection for x-axis

Fixed Bugs:
- When switching channels, channel data didn't reprocess before updating figures if parameter 
    was changed. Now keeps up-to-date all channels and data types
- Read Channels input couldn't detect a list of channels
- Theme wasn't carried to save panel when selected
- Save option still enabled during data loading, now disabled only during loading
- Histogram feature experienced significant lag during processing. Code rewritten using edge detection for efficiency

v1.5.12.20
Added Features:
- Minimum and Maximum voltage limits added for signal viewing
- Artifact rejection applied to imported signal with moveable threshold
- Added option to display removed artifact data over raw data figure
- Excluded files option with comma delimited inputs, checks correct spelling
- Buttons and dropdowns bigger with increased text size
- Sampling Rate field updates depending on file type input
- Status Indicator size increased
- Updated Menu

Fixed Bugs:
- File type stayed fixed at ns5, now allows nf3 and analog
- Figures would attempt to plot if viewing settings changed even if data not loaded. Now checks if data is loaded
- Adding new channels updated channel dropdown menu in order of loading. Now ordered numerically and refreshed after new channel
- Downsampling rate not updating figures if changed
- Save Panel freezes without closing if main GUI closed, now closes with main GUI
- Loading channel data overwrote data for preexisting channel, now skips if channel data already loaded
- Figures updated altogether instead of needed figures, now performs selective figure updating
- Main GUI started at lower corner of screen, now centered

v1.5.8.20
Added Features:
- Added Time start and end inputs for time viewing limits across all figures
- threshold value change updated spike amplitude and bin figures
- Save panel
- Saving data as .mat file
- Filtering settings added
- File type input selection
- Time window inputs scale to length of imported signal
- Load data from channel specified
- Status indicator for user feedback 






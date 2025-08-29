# This function calculates the rolling average of concentration values within a specified time window (in weeks) centered around a given focal date. It identifies dates within the window, extracts the corresponding concentration values, and returns their mean, ignoring any missing (NA) values.

roll_avg <- function(focal_date, dates, concs, win_size_wks) {
  # Determine which dates are in the window. Convert weeks to days
  is_in_window <- (dates > ((focal_date) - (win_size_wks / 2) * 7)) &
    (dates < (focal_date + (win_size_wks / 2) * 7))
  # Find the associated concentrations
  window_concs <- concs[is_in_window]
  # calculate the mean
  result <- mean(window_concs, na.rm = TRUE)
  
  return(result)
}



  
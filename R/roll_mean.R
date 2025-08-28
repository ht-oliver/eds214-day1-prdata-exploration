roll_avg <- function(focal_date, dates, concs, win_size_wks) {
  # Determine which dates are in the window. Convert weeks to days
  is_in_window <- (dates > ((focal_date) - (win_size_wks / 2) * 7)) &
    (dates < (focal_date + (win_size_wks / 2) * 7))
  # Find the associated concentrations
  window_concs <- concs[is_in_window]
  # calculate the mean
  result <- mean(window_concs)
  
  return(result)
}



  
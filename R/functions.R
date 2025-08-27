roll_avg <- function(focal_date, dates, concs, win_size_wks) {
  # Which dates are in the window. Converting wks to days
  is_in_window <- (dates > ((focal_date) - (win_size_wks / 2) * 7)) &
    (dates < (focal_date + (win_size_wks / 2) * 7))
  # Find the associated concentrations
  window_concs <- concs[is_in_window]
  # calculate the mean
  result <- mean(window_concs)
  
  return(result)
}

apply_rollmean <- function(df, date_col, constituent) {
  sapply(
    df$date_col,
    roll_avg,
    dates = df$date_col,
    conc = df$constituent,
    win_size_wks = 9
  )
}


  
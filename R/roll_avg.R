# This function calculates the rolling average of concentration values within a specified time window (in weeks) centered around a given focal date. It identifies dates within the window, extracts the corresponding concentration values, and returns their mean, ignoring any missing (NA) values.

#' Rolling average function
#'
#' @param focal_date - An individual date that will serve as the midpoint of the dates that will be considered in mean function.
#' @param dates - A vector of dates that will be considered in the rolling mean function. 
#' @param concs - A vector of numeric concentration values, the mean of which will be calculated. 
#' @param win_size_wks - A constant numeric value, the number of weeks that should be considered in an average.
#'
#' @returns - This function returns the mean value of the number (win_size_wks) of values (concs) that were input.
#' @export
#'
#' @examples - focal_date = 01/01/2001, dates <- c(2000-12-25, 2001-01-01, 2001-01-08), concs <- c(3, 3, 12), win_size_wks = 3
#' 
#' roll_avg(01/01/2001, c(dates), concs, 3)
#' return <- 6
#'    
#' 
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



  
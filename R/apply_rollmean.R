
apply_rollavg <- function(df, date_col, constituent) {
  sapply(df[[date_col]], FUN = roll_avg,
         focal_date = 
    df[[date_col]], #indexing into the dataframe
    dates = df[[date_col]],
    conc = df[[constituent]],
    win_size_wks = 9
  )
}


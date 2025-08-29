# This script contains the plot that produces Fig 2

figure_2 <- ggplot(data_comb_avgs,
                   aes(x = sample_date,
                       y = conc,
                       color = site_id, # different colored lines by site_id
                       group = site_id)) + # draw lines based on site-id
  geom_line(linetype = "solid") +
  facet_wrap(~ constituent, # facet by constituent
             ncol = 1,
             scales = "free_y", # each plot gets it's own y-axis
             strip.position = "left") + # graph titles on left
  labs(
    title = "Constituent Concentrations Over Time by Site",
    x = "Date",
    y = "Concentration (mg/L)",
    color = "Site"
  ) +
  theme_minimal() +
  theme(
    strip.text = element_text(size = 6, face = "bold"),
    strip.placement = "outside",
    legend.position = "right"
  )

# prints Figure 2 to the viewer
figure_2


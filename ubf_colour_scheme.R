# colour scheme for UrBIOFuture survey report

ubf_colours <- c(
  lightgreen       = "#D3FF75",
  green            = "#98C455",
  darkgreen        = "#5D7531",
  black            = "#303F1B",
  lightgreen_faded = "#E6FFDC",
  green_faded      = "#CADDA9",
  darkgreen_faded  = "#ADBA98",
  black_faded      = "#2D3222")

ubf_cols <- function(...) {
  cols <- c(...)
  
  if (is.null(cols))
    return (ubf_colours)
  
  ubf_colours[cols]
}

ubf_palettes <- list(
  main  = ubf_cols("lightgreen","green","darkgreen", "black"),
  faded = ubf_cols("lightgreen_faded","green_faded","darkgreen_faded","black_faded"))

ubf_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- ubf_palettes[[palette]]
  
  if (reverse) pal <- rev(pal)
  
  colorRampPalette(pal, ...)
}


#colour
scale_colour_ubf <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- ubf_pal(palette = palette, reverse = reverse)
  
  if (discrete) {
    discrete_scale("colour", paste0("ubf_", palette), palette = pal, ...)
  } else {
    scale_colour_gradientn(colours = pal(256), ...)
  }
}

#fill
scale_fill_ubf <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- ubf_pal(palette = palette, reverse = reverse)
  
  if (discrete) {
    discrete_scale("fill", paste0("ubf_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}

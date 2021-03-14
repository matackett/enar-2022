# load packages ----------------------------------------------------------------

library(rsconnect)

# deploy tutorials -------------------------------------------------------------

deployApp(
  appDir = "tiktok-lyrics",
  appTitle = "TikTok lyrics",
  account = "minecr",
  forceUpdate = TRUE,
  launch.browser = TRUE
)

deployApp(
  appDir = "all-about-you",
  appTitle = "All about you!",
  account = "minecr",
  forceUpdate = TRUE,
  launch.browser = TRUE
)

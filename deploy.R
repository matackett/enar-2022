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
  appDir = "survey-analysis",
  appTitle = "Survey analysis",
  account = "minecr",
  forceUpdate = TRUE,
  launch.browser = TRUE
)

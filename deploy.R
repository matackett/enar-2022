# load packages ----------------------------------------------------------------

library(rsconnect)

# deploy tutorials -------------------------------------------------------------

deployApp(
  appDir = "tiktok-lyrics",
  appTitle = "TikTok Lyrics",
  account = "minecr",
  forceUpdate = TRUE,
  launch.browser = TRUE
)

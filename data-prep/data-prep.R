# load packages ----------------------------------------------------------------

library(tidyverse)
library(genius)
library(tidytext)

# fetch lyric data -------------------------------------------------------------

savage_love <- genius_url("https://genius.com/Jawsh-685-and-jason-derulo-savage-love-laxed-siren-beat-lyrics") %>%
  mutate(
    artist = "Jason Derulo & Jawsh 685",
    track_title = "Savage Love"
    )

wellerman   <- genius_url("https://genius.com/The-longest-johns-wellerman-lyrics") %>%
  mutate(artist = "Nathan Evans")

friendships <- genius_url("https://genius.com/Pascal-letoublon-friendships-lost-my-love-lyrics") %>%
  mutate(
    artist = "Pascal Letoublon",
    track_title = "Friendships"
  )

iko_iko_lyrics <- read_lines("data-prep/lyrics/ikoiko.txt")
iko_iko <- tibble(
  track_title = rep("Iko Iko", length(iko_iko_lyrics)),
  line        = 1:length(iko_iko_lyrics),
  lyric       = iko_iko_lyrics,
  artist      = rep("Justin Wellington", length(iko_iko_lyrics))
)

say_so       <- genius_url("https://genius.com/Doja-cat-say-so-lyrics") %>%
  mutate(artist = "Doja Cat")

bored_in_the_house <- genius_url("https://genius.com/Tyga-and-curtis-roach-bored-in-the-house-lyrics") %>%
  mutate(artist = "Tyga and Curtis Roach")

dont_start_now <- genius_url("https://genius.com/Dua-lipa-dont-start-now-lyrics") %>%
  mutate(artist = "Dua Lipa")

oh_no <- genius_url("https://genius.com/Kreepa-oh-no-lyrics") %>%
  mutate(artist = "Kreepa")

roses <- genius_url("https://genius.com/Saint-jhn-roses-imanbek-remix-lyrics") %>%
  mutate(
    artist = "SANIt JHN",
    track_title = "Roses"
  )

# get bad words ----------------------------------------------------------------

bad_words <- tibble(word = read_lines("https://raw.githubusercontent.com/LDNOOBW/List-of-Dirty-Naughty-Obscene-and-Otherwise-Bad-Words/master/en"))

# explore ----------------------------------------------------------------------

top_words <- function(song){
  song %>%
    unnest_tokens(word, lyric) %>%
    anti_join(stop_words) %>%
    anti_join(bad_words) %>%
    filter(!str_detect(word, "nigg")) %>%
    filter(!str_detect(word, "fuck")) %>%
    filter(!str_detect(word, "whor")) %>%
    count(word, sort = TRUE) %>%
    slice_head(n = 20)
}

top_words(bored_in_the_house)
top_words(dont_start_now)
top_words(friendships)
top_words(iko_iko)
top_words(oh_no)
top_words(roses)
top_words(savage_love)
top_words(say_so)
top_words(wellerman)

# write data -------------------------------------------------------------------

lyrics <- bind_rows(
  bored_in_the_house,
  dont_start_now,
  friendships,
  iko_iko,
  oh_no,
  roses,
  savage_love,
  say_so,
  wellerman
)

write_rds(lyrics, file = "tiktok-lyrics/data/lyrics.rds")

lyric_words <- lyrics %>%
  unnest_tokens(word, lyric) %>%
  anti_join(stop_words) %>%
  anti_join(bad_words) %>%
  filter(!str_detect(word, "nigg")) %>%
  filter(!str_detect(word, "fuck")) %>%
  filter(!str_detect(word, "whor")) %>%
  relocate(track_title, word)

write_rds(lyric_words, file = "tiktok-lyrics/data/lyric-words.rds")

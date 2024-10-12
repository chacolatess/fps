local video_processing = require("video_processing")

-- Define your video files
local videos = {
    "videos/goodbye_intro.mp4",
    "videos/farewell_message.mp4",
    "videos/uplifting_message.mp4",
}
local background_music = "videos/background_music.mp3"
local output_video = "goodbye_video.mp4"

-- Create the video montage
video_processing.create_montage(videos, background_music, output_video)

